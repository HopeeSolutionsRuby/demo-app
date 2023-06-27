# frozen_string_literal: true

class Product < ApplicationRecord
  include ProductActivities
  include Searchable

  belongs_to :category, touch: true, counter_cache: true, inverse_of: :products

  has_many :order_lines, inverse_of: :product, dependent: :restrict_with_exception
  has_many :orders, through: :order_lines, inverse_of: :products
  has_many :images, as: :imageable, dependent: :restrict_with_exception, inverse_of: :imageable
  has_many :comments, as: :commentable, dependent: :restrict_with_exception, inverse_of: :commentable

  validates :name, :price, presence: true
  validates :price, :quantity, numericality: { greater_than_or_equal_to: 0 }

  scope :best_sell, ->(id) { where(category_id: id) }
  scope :custom_paginate, ->(current, per_page) { offset((current -1) * per_page).limit(per_page) }
  # Ex:- scope :active, -> {where(:active => true)}

  serialize :properties, JSON

  def self.ransackable_attributes(_auth_object = nil)
    %w[category_id created_at description id name price properties quantity updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "comments", "images", "order_lines", "orders"]
  end
end
