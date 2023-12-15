namespace :db do
  desc 'Seed data for tagging'
  task tag_seed: :environment do
    Tag.delete_all
    unless Tag.any?
      5.times do
        FactoryBot.create(:tag)
      end
    end
    puts 'Tagging seeding has been completed!'
  end
end
