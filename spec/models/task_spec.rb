require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'should have a name' do
    c = FactoryBot.create(:category, name: 'Kitkat', description: 'I love kitkat')
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
    c = FactoryBot.create(:category, name: 'Testing', description: 'I love Test')
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
    c = FactoryBot.create(:category, name: 'Testing', description: 'I love Test')
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
    c = FactoryBot.create(:category, name: 'Testing', description: 'I love Test')
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
    c = FactoryBot.create(:category, name: 'Testing', description: 'I love Test')
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
end
