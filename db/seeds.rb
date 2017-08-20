# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 User.create!(
  f_name: "Kevin",
  l_name: "Santos",
  email: "justKevyne@gmail.com",
  password: "justpass",
  password_confirmation: "justpass",
  activated: true,
  activated_at: Time.zone.now
)

 user = User.create!(
   f_name: "Glorius",
   l_name: "Vuyanzi",
   email: "glo@gmail.com",
   password: "hacked",
   password_confirmation: "hacked",
   activated: true,
   activated_at: Time.zone.now
 )
