require 'rails_helper'

RSpec.describe User, type: :model do

  it "should have a valid email" do
    user = User.new(email: 'invalidemail', password: "testingpassword")
    expect(user).to_not be_valid
    user.email = "testing@gmail.com"
    expect(user).to be_valid  
  end

  it "should have a password" do
    user = User.new(email: "testing@gmail.com", password:"")
    expect(user).to_not be_valid
    user.password = 'kitkat'
    expect(user).to be_valid
  end
end
