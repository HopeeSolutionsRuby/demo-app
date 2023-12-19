require 'rails_helper'

RSpec.describe "ClinicExports", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/clinic_exports/index"
      expect(response).to have_http_status(:success)
    end
  end

end
