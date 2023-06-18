# frozen_string_literal: true

require_relative 'callbacks/order_callbacks'

class Order < ApplicationRecord
  belongs_to :admin

  has_many :order_lines, dependent: :destroy, inverse_of: :order
  has_many :products, through: :order_lines

  validates :date, :total, presence: true
  validates :total, numericality: true

  validates_associated :admin

  after_create_commit do |order|
    OrderCallbacks.new.after_create_commit(order)
  end

  after_update_commit do |order|
    OrderCallbacks.new.after_update_commit(order)
  end
end
