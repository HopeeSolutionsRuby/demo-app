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

    def edit; end

    def update
      @clinic = Clinic.find(params[:id])
      if @clinic.update(clinic_params)
        redirect_to administrator_clinics_path
      else
        render :edit
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
