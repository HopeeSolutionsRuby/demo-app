# frozen_string_literal: true

json.array! @customers, partial: 'customer', as: :customer
