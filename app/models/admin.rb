class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         :recoverable, :rememberable, :validatable
=======
          :recoverable, :rememberable, :validatable
>>>>>>> origin/issue_35_implement_authen_admin
end
