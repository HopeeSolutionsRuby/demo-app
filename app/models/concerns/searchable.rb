# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  included do
    def self.search(keyword)
      column_names.dup.delete('id').each do |column_names|
        where("#{column_names} LIKE ?", "%#{sanitize_sql_like(keyword)}%")
      end.flatten
    end
  end
end
