# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(full_name: "Allie Rowan", user_name: "AlRow", email: "aileen.s.rowan@gmail.com", password: "password", password_confirmation: "password")

15.times do
  user = User.create!(full_name: FFaker::Name.name, user_name: FFaker::Internet.user_name, email: FFaker::Internet.email, password: "password", password_confirmation: "password")
  (3..15).to_a.sample.times do
    user.posts.create!(body: FFaker::Tweet.body)
  end
end
