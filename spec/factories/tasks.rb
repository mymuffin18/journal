FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyString" }
    date { Date.today }
    category { nil }
  end
end
