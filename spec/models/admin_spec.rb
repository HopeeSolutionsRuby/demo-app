require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'validations' do
    # Check username
    it { should validate_presence_of(:username) }

    # Check password
    it do
      should validate_format_of(:password)
      .with(/\A(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}\z/)
      .with_message('should contain at least one letter, one number, and be at least 6 characters long')
    end
  end
end
