# frozen_string_literal: true

class Serialize < ApplicationRecord
  serialize :properties, Hash
end
