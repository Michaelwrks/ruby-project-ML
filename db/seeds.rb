# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# seed.rb
require 'faker'


13.times do
  creator_artist = CreatorArtist.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',  
    category: Faker::Lorem.word,
    image_url: Faker::Internet.url,
    # description: Faker::Lorem.sentence,
  )
  creator_artist.save!
end
