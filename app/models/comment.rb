# frozen_string_literal: true

class Comment < ApplicationRecord
  # polymorphic with comments and replies of comments
  # has_many :comments, as: :commentable, dependent: :restrict_with_exception, inverse_of: :commentable
  belongs_to :owner, polymorphic: true, inverse_of: :comments, optional: true 
  belongs_to :commentable, polymorphic: true, inverse_of: :comments, optional: true 

  # self join with comments and replies of comments
  belongs_to :parent, class_name: 'Comment', optional: true, inverse_of: :replies, counter_cache: :replies_count
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', inverse_of: :parent, dependent: :destroy
end
