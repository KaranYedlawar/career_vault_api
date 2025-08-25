FactoryBot.define do
  factory :application do
    job { nil }
    freelancer { nil }
    cover_letter { "MyText" }
    status { 1 }
  end
end
