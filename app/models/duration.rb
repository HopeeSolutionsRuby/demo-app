# frozen_string_literal: true

# Custom data type Duration
class Duration
  # Used for `serialize` method in ActiveRecord
  class << self
    def load(duration)
      return unless duration

      ActiveSupport::Duration.build(duration)
    end

    def dump(obj)
      unless obj.is_a?(self)
        raise ::ActiveRecord::SerializationTypeMismatch,
              "Attribute was supposed to be a #{self}, but was a #{obj.class}. -- #{obj.inspect}"
      end

      obj.length.to_i
    end
  end

  attr_accessor :minutes, :hours

  def initialize(duration)
    @hours = duration / 60
    @minutes = duration % 60
  end

  def length
    (hours.to_i * 60) + minutes.to_i
  end
end
