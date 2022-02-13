FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2022-02-13 20:08:47" }
  end
end
