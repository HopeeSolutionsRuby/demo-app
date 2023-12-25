# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it 'validates the numericality of age' do
      should validate_numericality_of(:age).only_integer.is_greater_than(0)
    end
    it 'validates the length of full name' do
      should validate_length_of(:full_name).is_at_most(255)
    end
    it 'validates the inclusion of gender' do
      should define_enum_for(:gender)
    end
    it { should have_many(:taggables).dependent(:destroy) }
    it { should have_many(:tags).through(:taggables) }
  end
end
