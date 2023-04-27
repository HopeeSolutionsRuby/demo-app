class User < ApplicationRecord
	has_many :articles
	has_many :carts
	has_many :payments
	has_one :profile
	validate :blank
	validate :is_to_numeric

	private

	def blank
		errors.add(:password, 'please insert your password') if password.empty?
	end	

	def is_to_numeric
		errors.add(:password, 'Your password contains only digits, please try again') if password.match?(/\A\d+\z/)
	end	
end 
