# frozen_string_literal: true

json.array! @doctors, partial: 'doctors/doctor', as: :doctor
