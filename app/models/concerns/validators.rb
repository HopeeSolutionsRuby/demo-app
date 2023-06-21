module Basicvalidate
  extend ActiveSupport::Concern

  included do
    validates :first_name, :last_name, :contact_number, :email, presence: true
  end
end