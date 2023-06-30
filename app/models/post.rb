# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :title, presence: true, length: { in: 10..50 }
  validates :content, presence: true
end
