 frozen_string_literal: true

class CategoryCallbacks
  def before_create(category)
    Rails.logger.debug { "before_create #{category.name}" }
  end

  def after_save(category)
    Rails.logger.debug { "after_save #{category.name}" }
  end

  def before_destroy(category)
    if category.name.downcase == 'faked' && category.description.downcase == 'faked'
      Rails.logger.debug 'before_destroy "faked"'
    else
      Rails.logger.debug 'before_destroy'
    end
  end

  def method_missing(method_name, *_arg)
    Rails.logger.debug { "Error: #{method_name} method is not defined" }
  end

  def respond_to_missing?(method_name, include_private = false)
    super
  end
end
# class CategoryCallbacks
#   def initialize(method_name)
#     @method_name = method_name
#   end

#   def before_save(category)
#     category.name = category.name.split(' ').map(&:capitalize).join(' ')
#     p "before_save #{category.name}"
#     send(@method_name, category) if respond_to?(@method_name)
#   end
# end
