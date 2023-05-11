require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject { build(:admin) }

  let(:admin) { create(:admin, phone: "1234567890", status: "active", role: "admin") }
  let(:admin_attributes) { attributes_for(:admin) }

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('test@example.com').for(:email) }
    it { should validate_length_of(:phone).is_equal_to(10)}  
    it { should validate_presence_of(:phone) }
    it { should allow_value('1234567890').for(:phone) }
    it { should_not allow_value('abc').for(:phone) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(active: 0, inactive: 1) }
    it { should define_enum_for(:role).with_values(admin: 0, customer_service: 1) }
  end

  describe '#active_for_authentication?' do
    context 'when admin is active' do
      let(:admin) { create(:admin, phone: "1234567890", status: "active", role: "admin") }
      
      it 'returns true' do
        expect(admin.active_for_authentication?).to eq(true)
      end
    end

    context 'when admin is inactive' do
      let(:admin_inactive) { create(:admin, status: :inactive, phone: "1234567890") }

      it 'returns false' do
        expect(admin_inactive.active_for_authentication?).to eq(false)
      end
    end
  end

  describe 'callbacks' do
    context 'when saving an admin' do
      let(:admin) { build(:admin, email: 'HONGTHAM@GMAIL.COM', phone: 1234567890) }
      before(:each) do
        admin.save!
      end

      it 'downcases the admin email' do
        expect(admin.email).to eq('hongtham@gmail.com')
      end

      it 'converts the admin phone to a string' do
        expect(admin.phone).to eq('1234567890')
      end
    end
  end 
end
