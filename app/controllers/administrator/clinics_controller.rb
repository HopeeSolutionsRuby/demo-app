# frozen_string_literal: true

module Administrator
  # Path: app/controllers/administrator/clinics_controller.rb
  class ClinicsController < BaseController
    include Pagy::Backend
    def index
      # @clinics = []
      # 30.times do
      #   clinic = FactoryBot.create(:clinic)
      #   @clinics << clinic
      # end
      @q = Clinic.ransack(search_params)
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

    def author_params
      params.require(:author).permit(:id, :name, :address, :region, :faculity, { pictures: [] })
    end

    def search_params
      params.fetch(:query, {}).permit!
    end
  end
end
