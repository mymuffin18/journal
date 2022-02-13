require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe "POST /users" do
    it "should create a user" do

       post '/users/', params: { user: {
          email: "email@gmail.com",
          password: "testing"
        }
      }

      expect(response).to have_http_status(:created)
      expect(response.headers['Authorization']).to include('Bearer')

    end
  end
end
