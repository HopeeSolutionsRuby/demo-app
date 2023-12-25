# frozen_string_literal: true

FactoryBot.define do
  factory :taggable do
    customer { nil }
    tag { nil }
  end
end
