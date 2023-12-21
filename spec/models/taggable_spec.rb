# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Taggable, type: :model do
  it { should belong_to(:customer) }
  it { should belong_to(:tag) }
end
