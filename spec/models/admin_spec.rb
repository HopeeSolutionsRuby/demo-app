require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'validations' do
    # Check username
    it { should validate_presence_of(:username) }

    # Check password
    it 'validates password format' do
      admin = Admin.create(username: 'test_admin', password: 'pass12')

      expect(admin.errors[:password]).not_to include('should contain at least one letter, one number, and be at least 6 characters long')
    end

    it 'validates password not format' do
      admin = Admin.create(username: 'test_admin', password: 'passss', email: 'dat@gmail.com')
    
      expect(admin.errors.full_messages).to include('Password should contain at least one letter, one number, and be at least 6 characters long')
    end
  end
end
