require 'rails_helper'
require 'devise/jwt/test_helpers'


RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it 'returns all categories' do
      user = User.create(email: 'testing@gmail.com', password: 'password')
      # user = FactoryBot.create(:user, email: "testing@gmail.com", password: "password")
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      c1 = FactoryBot.create(:category, name: 'testing', description: 'this is a description', user:user)
      c2 = FactoryBot.create(:category, name: 'testing2', description: 'this is another description', user:user)

      get '/api/v1/categories', headers: auth_headers

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'returns a category' do
      user = FactoryBot.create(:user, email: 'test@gmail.com', password: 'testing')
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
   
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      cat = FactoryBot.create(:category, name: 'testing', description: 'this is a description', user:user)

      get "/api/v1/categories/#{cat.id}", headers: auth_headers

      expect(response).to have_http_status(:success)

    end
  end

  describe "POST /categories" do
    it 'creates a new category' do
      user = FactoryBot.create(:user, email: 'test@gmail.com', password: 'testing')
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
   
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      expect {
        post '/api/v1/categories', headers: auth_headers, params: {category: {name: 'this is a name', description: 'this is a description', user_id: user.id}}.to_json
        
      }.to change { Category.count }.from(0).to(1)
    
      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH/PUT /categories/:id" do
    # it 'should update the category data' do
    #   user = FactoryBot.create(:user, email: 'test@gmail.com', password: 'testing')
    #   headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
   
    #   auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
    #   cat = FactoryBot.create(:category, name: 'testing', description: 'description', user:user)
    #   patch "/api/v1/categories/#{cat.id}", headers: auth_headers, params: {category: {description: 'test'}}.to_json

    #   expect(response).to have_http_status(200)
    #   json_body = JSON.parse(response.body)
    #   # expect(json_body['name']).to eq('kitkat')
    #   # expect(json_body['description']).to eq('i love kitkat')
    # end

    it 'should update the category data' do
      user = FactoryBot.create(:user, email: 'test@gmail.com', password: 'testing')
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
   
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      cat = FactoryBot.create(:category, name: 'testing', description: 'description', user:user)
      put "/api/v1/categories/#{cat.id}", params: {category: {name: 'kitkat', description: 'i love kitkat'}}.to_json, headers: auth_headers

      expect(response).to have_http_status(200)
      json_body = JSON.parse(response.body)
      expect(json_body['name']).to eq('kitkat')
      expect(json_body['description']).to eq('i love kitkat')
    end
  end

  describe 'DELETE /categories/:id' do
    let!(:user) { FactoryBot.create(:user, email: 'test@gmail.com', password:'testing')}
    let!(:cat) { FactoryBot.create(:category, name: 'testing', description: 'this is a description', user: user) }
    it 'deletes a category' do
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
   
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      expect {
        delete "/api/v1/categories/#{cat.id}", headers: auth_headers
    }.to change {Category.count}.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
