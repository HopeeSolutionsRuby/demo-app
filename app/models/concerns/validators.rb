# frozen_string_literal: true

# Custom validate
module Validators
  extend ActiveSupport::Concern

  included do
    validates :first_name, :last_name, :contact_number, :email, presence: true
    validates :contact_number, :email, uniqueness: true
    validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/,
                                                 message: 'only allows letters' }

    def display_student_age
      if dob.present?
        age = Date.today.year - dob.year
        puts "===Age of student is #{age}==="
      else
        puts '===Age cannot be calculated without date of birth==='
      end
    end

    def name_is_duc?
      first_name == 'Duc'
    end

    def upcase_name
      first_name.upcase
      last_name.upcase
      puts 'name has been capitalized'
    end
  end
end
