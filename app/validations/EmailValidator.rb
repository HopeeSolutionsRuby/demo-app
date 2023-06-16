class EmailValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		unless value =~ /[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+/
			record.errors.add attribute, (options[:message] || 'is not an valid email')
		end
	end
end