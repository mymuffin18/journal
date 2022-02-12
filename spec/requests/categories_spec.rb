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

      # get '/api/v1/categories/2'

      # expect(response).to_not have_http_status(:success)
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
