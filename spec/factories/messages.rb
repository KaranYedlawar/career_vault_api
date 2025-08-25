FactoryBot.define do
  factory :message do
    contract { nil }
    user { nil }
    content { "MyText" }
    read_at { "2025-08-25 21:51:50" }
  end
end
