# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Attendance.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end


User.create!(email: "charlotte10@yopmail.com", password: "abcdefgj", first_name: "Cha", last_name: "lalala", description: "longue description pour faire des tests avec mon super tableau de mon super profil")
User.create!(email: "charlotte112@yopmail.com", password: "abcdefgj", first_name: "Jules", last_name: "martin", description: "longue description pour faire des tests avec mon super tableau de mon super profil")
User.create!(email: "charlotte13@yopmail.com", password: "abcdefgj", first_name: "Denise", last_name: "Marthe", description: "longue description pour faire des tests avec mon super tableau de mon super profil")
User.create!(email: "charlotte14@yopmail.com", password: "abcdefgj", first_name: "Nadine", last_name: "Perche", description: "longue description pour faire des tests avec mon super tableau de mon super profil")



10.times do 
  Event.create!(
    title: "#{Faker::Marketing.buzzwords} #{Faker::Marketing.buzzwords}",
    description: Faker::Lorem.sentence(word_count: 10),
    administrator: User.all.sample,
    start_date: "2020-03-12",
    location: Faker::Address.city,
    duration: 30,
    price: 12
    )
end

20.times do
    Attendance.create!(
        event: Event.all.sample,
        user: User.all.sample
        )
end