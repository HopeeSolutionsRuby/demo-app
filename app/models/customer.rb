class Customer < ApplicationRecord
	validates :name, presence: true, length: { minimum: 2, maximum: 50 }
	validates :name, :age, :sex, presence: true
    validates :age, numericality: { only_integer: true }

    has_many :orders
    has_many :reviews

end 
