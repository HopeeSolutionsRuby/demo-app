require 'rails_helper'

RSpec.describe "ClassRooms", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/class_rooms/index"
      expect(response).to have_http_status(:success)
    end
  end

end
