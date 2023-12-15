# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'validations' do
    # Check username presence
    it { should validate_presence_of(:username) }
    # Check password presence and lenghth
    it { should validate_presence_of(:password) }
    it 'Requires a minimum password length of 6 characters' do
      should validate_length_of(:password).is_at_least(6)
    end
    context 'valid passwords' do
      it { should allow_value('password123').for(:password) }
      it { should allow_value('pass12').for(:password) }
    end
    context 'invalid passwords' do
      it { should_not allow_value('12345678').for(:password) }
      it { should_not allow_value('abcdefgh').for(:password) }
    end
  end
end
