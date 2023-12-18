# frozen_string_literal: true

module Administrator
  # Path: app/controllers/administrator/clinics_controller.rb
  class ClinicsController < BaseController
    include Pagy::Backend
    def index
      @q = Clinic.ransack(search_params)
      @clinics = @q.result(distinct: true)

      @pagy, @paginated_clinics = pagy(@clinics, items: 10)
    end

    def new
      @clinic = Clinic.new
    end

    def show
      @clinic = Clinic.find(params[:id])
    end

    def create
      @clinic = Clinic.new(clinic_params)

      respond_to do |format|
        if @clinic.save
          format.html { redirect_to '/administrator/clinics', notice: 'Clinic was successfully created.' }
          format.json { render :show, status: :created, location: @clinic }
        else
          errors_message = @clinic.errors.full_messages.join(', ')
          format.html { redirect_to '/administrator/clinics', notice: errors_message }
          format.json { render json: @clinic.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @clinic = Clinic.find(params[:id])
    end

    def destroy
      @clinic = Clinic.find(params[:id])
      return unless @clinic.destroy

      redirect_to administrator_clinics_path
    end

    def update
      @clinic = Clinic.find(params[:id])

      if params[:pictures].present?
        existing_pictures = @clinic.pictures || []
        new_pictures = Array(params[:pictures].values)
        updated_pictures = existing_pictures + new_pictures
      else
        updated_pictures = @clinic.pictures
      end

      if @clinic.update(clinic_params.merge(pictures: updated_pictures))
        redirect_to administrator_clinics_path
      else
        render :edit
      end
    end

    private

    def clinic_params
      if params[:pictures].present?
        params.permit(:id).merge(pictures: params[:pictures].values)
      else
        params.require(:clinic).permit(:id, :name, :address, :region, :faculity, :pictures)
      end
    end

    def search_params
      params.fetch(:query, {}).permit!
    end
  end
end