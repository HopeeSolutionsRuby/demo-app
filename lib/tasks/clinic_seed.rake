# frozen_string_literal: true

namespace :db do
  desc 'Seed data for customers'
  task clinic_seed: :environment do
    Clinic.delete_all
    unless Clinic.any?
      200.times do
        FactoryBot.create(:clinic)
      end
    end
    puts 'Clinic seeding has been completed!'
  end
end
