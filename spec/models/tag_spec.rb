# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }
    it { should have_many(:taggables).dependent(:destroy) }
    it { should have_many(:customers).through(:taggables) }
  end
end
