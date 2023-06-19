# frozen_string_literal: true

class PostPoly < ApplicationRecord
  belongs_to :postable, polymorphic: true
end
