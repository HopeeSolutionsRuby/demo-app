# frozen_string_literal: true

class ApplicationService
  def initialize(params)
    @params = params
  end

  def self.call(...)
    new(...).call
  end
end
