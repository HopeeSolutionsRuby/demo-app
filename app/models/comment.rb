# frozen_string_literal: true

class Comment < ApplicationRecord
  include GeneralCallbacks
  belongs_to :user
  belongs_to :post, counter_cache: true
  # validates_associated :user, :post
  # scope :comment_found, ->(post_id) { where(post_id: post_id).count }
  def self.ransackable_attributes(_auth_object = nil)
    %w[content created_at id post_id updated_at user_id]
  end
  scope :search_by_user_id, ->(query) { ransack(user_id_eq: query).result }
  scope :search_by_post_id, ->(query) { ransack(post_id_eq: query).result }
end
