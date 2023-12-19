require 'rails_helper'

RSpec.describe "ClinicImports", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/clinic_imports/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/clinic_imports/create"
      expect(response).to have_http_status(:success)
    end
  end

end
