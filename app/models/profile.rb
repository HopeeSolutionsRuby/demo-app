class Profile < ApplicationRecord
	belongs_to :user
	validate :contain_letter

	private
	def contain_letter
		return false if date_of_birth.match(/[a-zA-Z]/)
	end

end
