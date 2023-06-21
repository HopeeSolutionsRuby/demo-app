class Author < ApplicationRecord

	validates :name, presence: true, length: { minimum: 2, maximum: 50 }
	validates :name, :country, :email, presence: true

	has_many :books, -> {order(year_published: :desc)}

	before_create :set_default_country 

	def set_default_country 
		puts "I am in before_create block"
	end
	
end
