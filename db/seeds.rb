# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "vegecook-admin@example.com",
  password: ENV['ADMIN_PASSWORD']
)

50.times do |n|
  User.create!(
    email: "veggie-life-#{n + 1}@example.com",
    name: "hana_#{n + 1}",
    password: ENV['USER_PASSWORD']
  )
end