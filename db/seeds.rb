# require "open-uri"
require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# URI.open('https://res.cloudinary.com/defczhpe0/image/upload/v1637062017/imd8v3hdaxeb1ajyy153.jpg')
# dwarf = Dwarf.new(name: 'Bobo', price: 10, description: "Nice dwarf", localisation: "Brussels")
# dwarf.picture.attach(io: file, filename: 'dwarf.jpg', content_type: 'image/jpg')



User.destroy_all
Dwarf.destroy_all


puts 'Creating fake users'
aldric = User.new(email: 'aldricdg@gmail.com', encrypted_password: '123456', name: "De Gryse", surname: "Aldric")
nico = User.new(email: 'duboisnicolas98@gmail.com', encrypted_password: '123456', name: "Dubois", surname: "Nicolas")
romain = User.new(email: 'romain.bruyndonckx@gmail.com', encrypted_password: '123456', name: "bruyndonckx", surname: "Romain")
arthur = User.new(email: 'arthurvde@hotmail.fr', encrypted_password: '123456', name: "vde", surname: "Arthur")

users = [aldric, nico, romain, arthur]

puts 'Creating 10 fake dwarves...'
10.times do
  dwarf = Dwarf.new(
    name: Faker::Name,
    description: Faker::Lorem,
    localisation: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    price: rand(0..20),
    user_id: users.sample,
    availability: false
  )
  dwarf.save!
end

puts 'Finished!'
