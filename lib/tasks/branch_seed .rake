# frozen_string_literal: true

namespace :db do
  desc 'Seed data for customers'
  task branch_seed: :environment do
    Clinic.delete_all
    Branch.delete_all
    unless Branch.any?
      200.times do
        FactoryBot.create(:branch)
      end
    end
    puts 'Clinic seeding has been completed!'
  end
end
