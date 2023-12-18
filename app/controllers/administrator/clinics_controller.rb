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
      @clinic.destroy!
      p @clinic.destroy!
      respond_to do |format|
        format.html { redirect_to administrator_clinics_path, notice: 'Clinic was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    

    def update
      @clinic = Clinic.find(params[:id])

      respond_to do |format|
        if @clinic.update(clinic_params)
          format.html { redirect_to '/administrator/clinics', notice: 'Clinic was successfully updated.' }
          format.json { render :index, status: :edited }
        else
          errors_message = @clinic.errors.full_messages.join(', ')
          format.html { redirect_to '/administrator/clinics', notice: errors_message }
          format.json { render json: @clinic.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def clinic_params
        params.require(:clinic).permit(:id, :name, :address, :region, :faculity, pictures: [])
    end

    def search_params
      params.fetch(:query, {}).permit!
    end
  end
end
