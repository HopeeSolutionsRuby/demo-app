class Review < ApplicationRecord
  belongs_to :rvtable, polymorphic: true
end
