module StudentCallback
  extend ActiveSupport::Concern
  included do
    before_validation :check_name
  end

  def check_name
    return unless name == 'Tu dep trai'

    Rails.logger.debug 'Nah nah! This is a beautiful name'
    throw :abort
  end
end
