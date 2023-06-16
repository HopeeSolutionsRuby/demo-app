# frozen_string_literal: true
require 'factory_bot'
require 'faker'
include FactoryBot::Syntax::Methods

Faker::Config.locale = 'vi'
# Seed faculties
5.times do
  Faculty.create(
    name: Faker::Games::Dota.hero,
    year: rand(1998..2015)
  )
end

# Seed students
50.times do
  Student.create(
    name: Faker::Name.unique.name,
    year: Faker::Number.between(from: 1, to: 4),
    faculty_id: Faculty.pluck(:id).sample
  )
end

# Seed subjects
15.times do
  Subject.create(
    name: Faker::Job.position,
    credit: rand(2..5),
    faculty_id: Faculty.pluck(:id).sample
  )
end

# Seed terms 
15.times do
  Term.create(
    subject_id: Subject.pluck(:id).sample,
    semester: rand(1..2),
    year: rand(2019..2024),
    teacher: Faker::Sports::Football.player
  )
end

# Seed results
25.times do
  Result.create(
    student_id: Student.pluck(:id).sample,
    term_id: Term.pluck(:id).sample,
    point: sprintf('%.2f', rand(0.0..10.0))
  )
end