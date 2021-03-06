
require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

10.times do
  city = ["Wonderland", "LaCasaDeBays", "Ton quartier préféré de ton quartier préféré", "Bisounoursland"].sample
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10, supplemental: true), email: "#{Faker::Name.first_name}@yopmail.com",encrypted_password: 'password')
  event = Event.create(title: Faker::Game.title, description: Faker::Lorem.sentence(word_count: 120, supplemental: true),price: Faker::Number.between(from: 1, to: 1000), location: city, start_date: Faker::Date.forward(days: 23), duration: 10)
  attendance = Attendance.create(user: user, event: event)
end

puts "10 users, attendances et events on été crées"