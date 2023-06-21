# frozen_string_literal: true

module GeneralCallbacks
  extend ActiveSupport::Concern
  included do
    before_create :reset_auto_increment
  end
  def reset_auto_increment
    ActiveRecord::Base.connection.execute("ALTER TABLE #{self.class.table_name} AUTO_INCREMENT = 1")
  end
end
