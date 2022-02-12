require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks/:id" do
    it 'it returns a task' do
      c = FactoryBot.create(:category, name: 'testing', description: 'this is a test')
      
    end
  end
end
