# frozen_string_literal: true

module GeneralCallbacks
  extend ActiveSupport::Concern
  included do
    before_create :reset_auto_increment
    # after_destroy :reset_id_to_one
  end
  def reset_auto_increment
    ActiveRecord::Base.connection.execute("ALTER TABLE #{self.class.table_name} AUTO_INCREMENT = 1")
  end
  # BUG: somethings went wrong when i trying to reset id to one while destroy a row
  # def reset_id_to_one
  #   last_record = self.class.order(id: :desc).first

  #   if last_record.nil?
  #     ActiveRecord::Base.connection.execute("ALTER TABLE #{self.class.table_name} AUTO_INCREMENT = 1;")
  #   elsif last_record.id > 1
  #     ActiveRecord::Base.connection.execute("ALTER TABLE #{self.class.table_name} AUTO_INCREMENT = #{last_record.id + 1};")
  #   end
  # end
end
