FactoryBot.define do
  factory :post do
    user { nil }
    title { "MyString" }
    body { "MyText" }
    state { 1 }
  end
end
