FactoryBot.define do
  factory :poly_comment do
    content { "MyText" }
    commentable { nil }
  end
end
