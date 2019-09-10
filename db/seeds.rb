# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([
  {email: 'chesttest@tester.com', password:'secret', password_confirmation: 'secret'},
  {email: "moe@tester.com", password: "secret", password_confirmation: "secret"}
  ])

admins = Admin.create([
  {email: 'rsmoke@umich.edu', password:'secret', password_confirmation: 'secret'}
  ])