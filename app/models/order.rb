class Order < ApplicationRecord
	belongs_to :customer 
	has_and_belongs_to_many :books, join_table: 'books_orders'

	enum :status, [:shipped, :being_packed, :complete, :cancelled]

	scope :created_before, ->(time) { where(created_at: ...time)}
end
