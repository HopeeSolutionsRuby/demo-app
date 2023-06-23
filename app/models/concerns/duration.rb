# frozen_string_literal: true

class Duration
  class << self
    def load(duration)
      new(duration || 0)
    end

    def dump(obj)
      unless obj.is_a?(self)
        raise ::ActiveRecord::SerializationTypeMismatch,
              "Attribute was supposed to be a #{self}, but was a #{obj.class}. -- #{obj.inspect}"
      end

      obj.length
    end
  end

  attr_accessor :hours, :minutes, :seconds

  def initialize(duration = 0)
    @hours = duration.to_i / 3600
    @minutes = (duration.to_i - (@hours * 3600)) / 60
    @seconds = duration.to_i % 60
  end

  def length
    (hours.to_i * 3600) + (minutes.to_i * 60) + seconds.to_i
  end
end
