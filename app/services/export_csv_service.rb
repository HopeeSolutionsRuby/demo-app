# frozen_string_literal: true

class ExportCsvService
  require 'csv'

  def initialize(objects, attributes)
    @attributes = attributes
    @objects = objects
    @header = attributes.map(&:to_s)
  end

  def perform
    CSV.generate do |csv|
      csv << header
      objects.each do |object|
        csv << attributes.map { |attr| object.public_send(attr) }
      end
    end
  end

  private

  attr_reader :attributes, :objects, :header
end
