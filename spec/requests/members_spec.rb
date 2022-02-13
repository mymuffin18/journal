require 'rails_helper'
require 'devise/jwt/test_helpers'
RSpec.describe "Members", type: :request do
  describe "GET /members" do
    it "status should be success" do
      user = FactoryBot.create(:user, email: "testing@gmail.com", password: "password")
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      # This will add a valid token for `user` in the `Authorization` header
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)

      get '/api/v1/members', headers: auth_headers

      expect(response).to have_http_status(:ok)
      res = JSON.parse(response.body)
      expect(res['email']).to eq(user.email)
      expect(res['id']).to eq(user.id)
    end
  end
end
