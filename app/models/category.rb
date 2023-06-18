# frozen_string_literal: true

require_relative 'callbacks/category_callbacks'

class Category < ApplicationRecord
  has_many :products, dependent: :destroy, inverse_of: :category

  validates :name, presence: true
  validates_associated :products

  before_create do |category|
    CategoryCallbacks.new.before_create(category)
  end
  after_validation CategoryCallbacks.new
  before_destroy CategoryCallbacks.new
  after_save CategoryCallbacks.new
  after_touch :touch_product_or_category
  
  private

  def touch_product_or_category
    Rails.logger.debug 'after_touch Category/Product'
  end

  def capitalize_words
    name.capitalize!
  end

  def name_faked?
    name.downcase == 'faked'
  end

  def description_faked?
    description.downcase == 'faked'
  end

  def log_if_faked
    Rails.logger.debug 'before_destroy faked'
  end
end
