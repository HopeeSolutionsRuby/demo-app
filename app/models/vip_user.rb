# frozen_string_literal: true

class VipUser < ApplicationRecord
  belongs_to :user, inverse_of: :vip_user
  enum rank: { bronze: 0, silver: 1, gold: 2, diamond: 3, priority: 4 }
end