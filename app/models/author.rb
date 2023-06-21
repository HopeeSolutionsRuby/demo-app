class Author < ApplicationRecord

	validates :name, presence: true, length: { minimum: 2, maximum: 50 }
	validates :name, :country, :email, presence: true

	has_many :books, -> {order(year_published: :desc)}

	before_create :set_default_country 

	before_update :set_default_email

	private

		def set_default_country 
			puts "I am in before_create block"
			if self.country.nil?
				self.country = 'Vietnam'
			end 
		end

		def set_default_email 
			puts 'I am in before_update block'
			if self.email.nil?
				self.email = 'author@example.com'
			end 
		end 
end
