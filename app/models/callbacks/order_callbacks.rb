# frozen_string_literal: true

class OrderCallbacks
  def after_create_commit(order)
    Rails.logger.debug { "after_commit_create #{order.id} - send email create" }
  end

  def after_update_commit(order)
    Rails.logger.debug { "after_commit_update #{order.id} - send email update" }
  end

  def method_missing(method_name, *_arg)
    Rails.logger.debug { "Error: #{method_name} method is not defined" }
  end

  def respond_to_missing?(method_name, include_private = false)
    super
  end
end
