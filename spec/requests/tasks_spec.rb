require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks/:id" do
    it 'it returns a task' do
      c = FactoryBot.create(:category, name: 'testing', description: 'this is a test')
      t = FactoryBot.create(:task, name: 'test', description: 'testing', date: Date.today, category:c)

      get "/api/v1/tasks/#{t.id}"
      expect(response).to have_http_status(:success)
    end
  end


  describe "POST /tasks" do
    let!(:cat) { FactoryBot.create(:category, name: 'testing', description: 'this is a description') }
    it 'creates a new task' do
      
      expect {
        post '/api/v1/tasks/', params: {task: {name: 'test', description: 'testing', date: Date.today, category_id: cat.id}}
      }.to change { Task.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH/PUT /tasks/:id" do
    it "should update data" do
      cat = FactoryBot.create(:category, name: 'testing', description: 'description')
      t = FactoryBot.create(:task, name: 'test', description: 'testing', date: Date.today, category:cat)
      put "/api/v1/tasks/#{t.id}", params: {task: {completed: true} }

      expect(response).to have_http_status(200)
      json_body = JSON.parse(response.body)
      expect(json_body['completed']).to eq(true)
    end
  end

  describe 'DELETE /tasks/:id' do
    let!(:cat) { FactoryBot.create(:category, name: 'testing', description: 'this is a description') }
    let!(:task) { FactoryBot.create(:task, name: 'testing', description: 'this is a description', date: Date.today, category_id: cat.id) }
    it 'deletes a category' do
      expect {
        delete "/api/v1/tasks/#{task.id}"
    }.to change {Task.count}.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
