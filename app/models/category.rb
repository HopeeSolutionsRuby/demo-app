# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent, class_name: 'Category', optional: true

  scope :subcate, ->(category) { where(parent_id: category) }
end
