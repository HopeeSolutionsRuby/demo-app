# frozen_string_literal: true

json.extract! book, :id, :published_at, :author_id, :created_at, :updated_at
json.url book_url(book, format: :json)
