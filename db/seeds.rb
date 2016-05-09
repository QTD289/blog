# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'faker'

#Create 30 random Users
for i in 1..30 do
  User.create(name: Faker::Name.last_name, password: "123")
end

#Create 100 random Articles for all User
for i in 1..100 do
  Article.create(title: Faker::Address.country, text: Faker::Lorem.paragraphs, user_id: (1+i%40), created_at: rand(2.years).seconds.ago)
end

#Create 1 Comment for each user
User.all.each do |user|
  Comment.create(body: Faker::Lorem.sentence, article_id: rand(1..Article.all.size), user_id: user.id)
end

#Create 10-30 random Comments for each Article
Article.all.each do |article|
  for i in 1..rand(10..40) do
    Comment.create(body: Faker::Lorem.sentence, article_id: article.id, user_id: rand(1..User.all.size))
  end
end