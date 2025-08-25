FactoryBot.define do
  factory :profile do
    user { nil }
    first_name { "MyString" }
    last_name { "MyString" }
    bio { "MyText" }
    hourly_rate { "9.99" }
    location { "MyString" }
  end
end
