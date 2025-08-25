FactoryBot.define do
  factory :milestone do
    contract { nil }
    title { "MyString" }
    amount_cents { 1 }
    due_date { "2025-08-25" }
    status { 1 }
    position { 1 }
  end
end
