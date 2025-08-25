FactoryBot.define do
  factory :job do
    client { nil }
    title { "MyString" }
    description { "MyText" }
    budget_cents { 1 }
    status { 1 }
  end
end
