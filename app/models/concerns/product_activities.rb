# frozen_string_literal: true

module ProductActivities
  extend ActiveSupport::Concern

  included do 
    before_validation :before_validation
    after_touch :after_touch
    before_save :before_save
    before_destroy :before_destroy
    after_destroy :after_destroy
    after_rollback :after_rollback

    def method_missing(method_name, *_arg)
      Rails.logger.debug { "Error: #{method_name} method is not defined" }
    end

    def respond_to_missing?(method_name, include_private = false)
      super
    end
  end

  def self.best_seller
    where('price > ?', 10000)
  end

  def before_validation
    self.name = name.split.map(&:capitalize).join(' ') if name.present?
    Rails.logger.debug 'before_validation Product'
  end

  def after_touch
    Rails.logger.debug 'after_touch Product'
  end

  def before_save
    self.price = 0 if price.negative?
    Rails.logger.debug 'before_validation Product'
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

  private

  def price_positive?
    price.positive?
  end
end
