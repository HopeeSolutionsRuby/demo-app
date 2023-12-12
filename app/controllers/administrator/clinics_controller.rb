module Administrator
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

    private

    def author_params
      params.require(:author).permit(:id, :name, :address, :region, :faculity)
    end

    def search_params
      params.fetch(:query, {}).permit(:name_or_address_or_faculity_or_region_cont, :s, :name_cont, :address_cont, :faculity_cont, :region_cont)
    end
  end
end
