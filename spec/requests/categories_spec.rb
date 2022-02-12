require 'rails_helper'


RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    it 'returns all categories' do
      FactoryBot.create(:category, name: 'testing', description: 'this is a description')
      FactoryBot.create(:category, name: 'testing2', description: 'this is another description')
      get '/api/v1/categories'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'returns a category' do
      cat = FactoryBot.create(:category, name: 'testing', description: 'this is a description')

      get "/api/v1/categories/#{cat.id}"

      expect(response).to have_http_status(:success)

    end
  end

  describe "POST /categories" do
    it 'creates a new category' do
      expect {
        post '/api/v1/categories', params: {category: {name: 'this is a name', description: 'this is a description'}}
    }.to change { Category.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH/PUT /categories/:id" do
    it 'should update the category data' do
      cat = FactoryBot.create(:category, name: 'testing', description: 'description')
      patch "/api/v1/categories/#{cat.id}", params: {category: {name: 'kitkat', description: 'i love kitkat'}}

      expect(response).to have_http_status(200)
      json_body = JSON.parse(response.body)
      expect(json_body['name']).to eq('kitkat')
      expect(json_body['description']).to eq('i love kitkat')
    end

    it 'should update the category using put' do
      cat = FactoryBot.create(:category, name: 'testing', description: 'description')
      put "/api/v1/categories/#{cat.id}", params: {category: {name: 'kitkat', description: 'i love kitkat'}}

      expect(response).to have_http_status(200)
      json_body = JSON.parse(response.body)
      expect(json_body['name']).to eq('kitkat')
      expect(json_body['description']).to eq('i love kitkat')
    end
  end

  describe 'DELETE /categories/:id' do
    let!(:cat) { FactoryBot.create(:category, name: 'testing', description: 'this is a description') }
    it 'deletes a category' do
      expect {
        delete "/api/v1/categories/#{cat.id}"
    }.to change {Category.count}.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
