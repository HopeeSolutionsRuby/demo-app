# frozen_string_literal: true

module Administrator
  # Path: app/controllers/administrator/clinics_controller.rb
  class ClinicsController < BaseController
    include Pagy::Backend
    def index
      filter_params = params[:query]
      if filter_params
        @selected_faculties = filter_params[:faculity_in]
        # if @selected_faculties.class == String
        #   @selected_faculties = @selected_faculties.split(',')
        # end
        @selected_regions = filter_params[:region_in]
      end
      @q = Clinic.ransack(search_params)
      @faculities = Clinic.all.pluck(:faculity).uniq
      @regions = Clinic.all.pluck(:region).uniq
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
          format.json { render :show, status: :created, location: @clinic, notice: 'Clinic was successfully created.' }
        else
          format.html do
            redirect_back fallback_location: '/administrator/clinics', alert: @clinic.errors.full_messages.join(', ')
          end
          format.json { render :new, status: :unprocessable_entity }
        end
      end
    end

    def edit
      @clinic = Clinic.find(params[:id])
    end

    def destroy
      @clinic = Clinic.find(params[:id])
      if @clinic.destroy
        flash[:alert] = 'Clinic has been deleted successfully.'
        redirect_to administrator_clinics_path
      else
        flash[:alert] = 'Failed to delete clinic.'
        redirect_back(fallback_location: root_path)
      end
    end

    def update
      @clinic = Clinic.find(params[:id])

      if params[:clinic][:pictures].present?
        existing_pictures = @clinic.pictures || []
        new_pictures = params[:clinic][:pictures]
        @clinic.pictures = existing_pictures + new_pictures
      end
      respond_to do |format|
        if @clinic.update(clinic_params.merge(pictures: @clinic.pictures))
          format.html { redirect_to '/administrator/clinics', notice: 'Clinic was successfully updated.' }
          format.json { render :index, status: :edited }
        else
          format.html do
            redirect_back fallback_location: '/administrator/clinics', alert: @clinic.errors.full_messages.join(', ')
          end
          format.json { render json: @clinic.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def clinic_params
      params.require(:clinic).permit(:name, :address, :region, :faculity, :remove_pictures, pictures: [])
    end

    def search_params
      params.fetch(:query, {}).permit!
    end
  end
end
