# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category, touch: true

  has_many :order_lines, inverse_of: :product
  has_many :orders, through: :order_lines

  validates :name, :price, presence: true
  validates :price, numericality: true

  before_validation :captialize_words

  before_create do
    self.name = "Create #{Time.zone.now}" if (name = 'Edited')
    Rails.logger.debug 'before_create'
  end

  before_save :ensure_price_not_negative

  before_save :change_description, if: :price_positive?

  after_initialize do |_product|
    Rails.logger.debug 'after_initialize'
  end

  after_find do |_product|
    Rails.logger.debug 'after_find'
  end

  before_destroy :before_destroy
  after_destroy :after_destroy
  after_rollback :after_rollback
  after_touch :touch_product

  private

  def ensure_price_not_negative
    self.price = 0 if price.negative?
    Rails.logger.debug 'before_validation Product'
  end

  def captialize_words
    self.name = name.split.map(&:capitalize).join(' ') if name.present?
    Rails.logger.debug 'before_validation Product'
  end

  def touch_product
    Rails.logger.debug 'after_touch Product'
  end

  def before_destroy
    Rails.logger.debug 'before_destroy Product'
  end

  def after_destroy
    Rails.logger.debug 'after_destroy Product'
  end

  def after_rollback
    Rails.logger.debug 'after_rollback Product'
  end

  def price_positive?
    price.positive?
    Rails.logger.debug 'before_save change_description'
  end

  def change_description
    self.description = 'positive'
  end
end
