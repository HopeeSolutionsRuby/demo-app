# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'validation tests' do
    let!(:employee) { build(:account, role: 0) }
    let!(:employer) { build(:account, role: 1) }
    let!(:admin) { build(:account, role: 2) }

    it 'ensures email presence' do
      account.email = nil
      expect(account.save).to eq(false)
    end

    it 'ensures phone presence' do
      account.phone = nil
      expect(account.save).to eq(false)
    end

    it 'ensures password presence' do
      account.password = nil
      expect(account.save).to eq(true)
    end

    it 'ensures avatar presence' do
      account.avatar = nil
      expect(account.save).to eq(true)
    end

    it 'assigns role as employee by default' do
      expect(account.employee?).to eq(true)
      expect(account.role).to eq('employee')
    end

    it 'allows valid role values' do
      account.role = 'employer'
      expect(account.save).to eq(true)

      account.role = 'admin'
      expect(account.save).to eq(true)
    end

    it 'should save successfully' do
      expect(account.save).to eq(true)
    end
  end
end
