class Product < ApplicationRecord
	belongs_to :category

	has_many :order_lines, inverse_of: :product
	has_many :orders, through: :order_lines

	validates :name, :price, presence: { strict: true }
	validates :price, numericality: true
end
