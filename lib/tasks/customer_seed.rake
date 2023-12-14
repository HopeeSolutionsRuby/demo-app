namespace :db do
  desc 'Seed data for customers'
  task customer_seed: :environment do
    Customer.delete_all
    unless Customer.any?
      Customer.not_send_email
      5.times do |i|
        FactoryBot.create(:customer)
      end
    end
    puts 'Customer seeding has been completed!'
  end
end
