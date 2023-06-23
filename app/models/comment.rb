# frozen_string_literal: true

class Comment < ApplicationRecord
  include GeneralCallbacks
  belongs_to :user
  belongs_to :post, counter_cache: true
  scope :count_for_post, ->(post_id) { where(post_id: post_id).count }
end
