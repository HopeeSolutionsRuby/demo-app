# frozen_string_literal: true

namespace :db do
  desc 'Seed data for doctor'
  task doctor_seed: :environment do
    Doctor.delete_all
    unless Doctor.any?
      200.times do
        FactoryBot.create(:doctor)
      end
    end
    puts 'Doctor seeding has been completed!'
  end
end
