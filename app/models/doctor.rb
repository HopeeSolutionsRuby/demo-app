class Doctor < ApplicationRecord
  validates :full_name, presence: true, length: { maximum: 50 }, format: { with: /\A[^0-9!@#$%^&*+_=]+\z/ }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP  }
  enum gender: { male: 0, female: 1, other: 2 }
  validates :gender, inclusion: { in: genders.keys }
  validates :address, presence: true
  validates :phone_number,:presence => true,
                 :length => { :minimum => 10, :maximum => 15 }
end
  