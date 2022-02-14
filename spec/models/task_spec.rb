require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should have a name' do
    user = User.create(email: "email@gmail.com", password: 'password')
    c = FactoryBot.create(:category, name: 'Kitkat', description: 'I love kitkat', user:user)
    t = Task.new(
      name: '',
      description: 'this is a description',
      date: Date.today,
      category: c
    )
    expect(t).to_not be_valid
    t.name = "this is a name"
    expect(t).to be_valid
  end

  it "should have a description" do
    user = User.create(email: "email@gmail.com", password: 'password')
    c = FactoryBot.create(:category, name: 'Testing', description: 'I love Test', user:user)
    t = Task.new(
      name: 'this is a name',
      description: '',
      date: Date.today,
      category: c
    )

    expect(t).to_not be_valid
    t.description = "this is a description"
    expect(t).to be_valid
  end

  it "name have at least 3 characters long" do
    user = User.create(email: "email@gmail.com", password: 'password')
    c = FactoryBot.create(:category, name: 'Testing', description: 'I love Test', user:user)
    t = Task.new(
      name: '',
      description: 'this is a description',
      date: Date.today,
      category: c
    )

    expect(t).to_not be_valid
    t.name = "123"
    expect(t).to be_valid
  end

  it "description should have at least 5 characters long" do
    user = User.create(email: "email@gmail.com", password: 'password')
    c = FactoryBot.create(:category, name: 'Testing', description: 'I love Test', user:user)
    t = Task.new(
      name: 'this is a name',
      description: '',
      date: Date.today,
      category: c
    )
    expect(t).to_not be_valid
    t.description = "12345"
    expect(t).to be_valid
  end

  it "should have a date" do
    user = User.create(email: "email@gmail.com", password: 'password')
    c = FactoryBot.create(:category, name: 'Testing', description: 'I love Test', user:user)
    t = Task.new(
      name: 'this is a name',
      description: 'this is a description',
      date: '',
      category: c
    )

    expect(t).to_not be_valid
    t.date = Date.today
    expect(t).to be_valid
  end

  it "date should not be before today" do
    user = User.create(email: "email@gmail.com", password: 'password')
    c = FactoryBot.create(:category, name: 'Testing', description: 'I love Test', user:user)
    t = Task.new(
      name: 'this is a name',
      description: 'this is a description',
      date: Date.new(2022, 2, 11),
      category: c
    )

    expect(t).to_not be_valid
    t.date = Date.today
    expect(t).to be_valid
    
  end
end
