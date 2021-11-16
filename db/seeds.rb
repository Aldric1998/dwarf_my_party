require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
URI.open('https://res.cloudinary.com/defczhpe0/image/upload/v1637062017/imd8v3hdaxeb1ajyy153.jpg')
dwarf = Dwarf.new(name: 'Bobo', price: 10, description: "Nice dwarf", localisation: "Brussels")
dwarf.picture.attach(io: file, filename: 'dwarf.jpg', content_type: 'image/jpg')
