# frozen_string_literal: true

module Administrator
  # Path: app/controllers/administrator/clinics_controller.rb
  class ClinicsController < BaseController
    include Pagy::Backend
    def index
      filter_params = params[:query]
      if filter_params
        @selected_faculties = filter_params[:faculity_in]
        @selected_insurance_infomations = filter_params[:insurance_infomation_in]
      end
      @q = Clinic.includes(:branches).ransack(search_params)

      @cities = Branch.all.pluck(:city, :clinic_id).uniq
      @clinics_by_city = {}
      @cities.each do |city, clinic_id|
        @clinics_by_city[city] ||= []
        clinic = Clinic.find_by(id: clinic_id)
        @clinics_by_city[city] << clinic if clinic
      end

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
      params.require(:clinic).permit(:name, :service_information, :insurance_infomation, :faculity, :remove_pictures, pictures: [],
                                                                                            branches_attributes: %i[id name address ward district city _destroy])
    end

    def search_params
      params.fetch(:query, {}).permit!
    end
  end
end
