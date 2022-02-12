FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyString" }
    date { "2022-02-12 12:07:00" }
    category { nil }
  end
end
