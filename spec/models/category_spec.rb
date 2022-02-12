require 'rails_helper'

RSpec.describe Category, type: :model do
  it "should have a name" do
    category = Category.new(
      name: '',
      description: 'this is a description'
    )

    expect(category).to_not be_valid
    category.name = 'this is a name'
    expect(category).to be_valid

  end

  it "should have a description" do
    category = Category.new(
      name: 'this is a title',
      description: ''
    )

    expect(category).to_not be_valid
    category.description = 'this is a description'
    expect(category).to be_valid
    
  end

  it "title should have at least 3 characters long" do
    category = Category.new(
      name: 'as',
      description: 'this is a description'
    )

    expect(category).to_not be_valid
    category.name = 'asd'
    expect(category).to be_valid
  end

  it "has a description between 5 and 50 characters" do
    category = Category.new(
      name: 'this is a title',
      description: ''
    )

    expect(category).to_not be_valid
    
    category.description = '12345'
    expect(category).to be_valid
    
    
    fifty = 'B2SoR8EvL4P5mYiPZqFAxYV68kPVWTkMlOTz0ITbPJjLijHdGO'
    category.description = fifty
    expect(category).to be_valid

    category.description = fifty + "1"
    expect(category).to_not be_valid
  end
end
