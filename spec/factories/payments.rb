FactoryBot.define do
  factory :payment do
    contract { nil }
    milestone { nil }
    amount_cents { 1 }
    status { 1 }
    stripe_payment_intent_id { "MyString" }
    stripe_transfer_id { "MyString" }
  end
end
