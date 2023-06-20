class Movie < ApplicationRecord
  has_many :reviews, as: :rvtable, dependent: :destroy
end
