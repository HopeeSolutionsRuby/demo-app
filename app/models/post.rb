class Post < ApplicationRecord
  include GeneralCallbacks
  belongs_to :user, counter_cache: true
end
