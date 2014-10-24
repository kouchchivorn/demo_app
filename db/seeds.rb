# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Kouch Chivorn",
                      email: "kouchchivorn5@yahoo.com",
                      password:  "foobar",
                      password_confirmation: "foobar")

5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@myblog.com"
  password = "password"
  User.create!(name: name,
                        email: email,
                        password: password,
                        password_confirmation: password)
end

users = User.order(:created_at).take(6)
1.times do
  title = Faker::Lorem.sentence(1)
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(title: title, content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..4]
followers = users[4..6]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
