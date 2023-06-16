class NameVyValidator < ActiveModel::Validator
	def validate(record)
		if record.first_name != "Vy"
			record.errors.add :first_name, "Name must be Vy"
		end
	end
end