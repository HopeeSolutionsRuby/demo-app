FactoryBot.define do
  factory :comment do
    commentable { nil }
    comment_text { "MyString" }
  end
end
