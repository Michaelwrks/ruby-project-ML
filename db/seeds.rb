# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# seed.rb
require 'faker'

categories = [
  'Producers',
  'Videographers',
  'Social Media Music Marketing Experts',
  'Songwriters',
  'Studio Engineers',
  'Promotion and Distribution Specialists'
]

category_descriptions = {
  'Producers' => [
    'Experienced producer with a track record of hit records.',
    'Skilled in music production and beat-making.',
    'Worked with top artists to create chart-topping hits.'
  ],
  'Videographers' => [
    'Award-winning videographer with a passion for storytelling.',
    'Proficient in video editing and cinematography.',
    'Captured stunning visuals for various music projects.'
  ],
  'Social Media Music Marketing Experts' => [
    'Social media guru specializing in music promotion.',
    'Built online communities and engaged fans.',
    'Successfully marketed music to millions of followers.'
  ],
  'Songwriters' => [
    'Talented songwriter with a knack for crafting lyrics.',
    'Wrote heartfelt songs for renowned artists.',
    'Collaborated with top musicians to create memorable tunes.'
  ],
  'Studio Engineers' => [
    'Experienced studio engineer with an ear for quality sound.',
    'Mixed and mastered countless tracks to perfection.',
    'Produced high-quality audio in top-notch studios.'
  ],
  'Promotion and Distribution Specialists' => [
    'Expert in music promotion and distribution strategies.',
    'Managed successful marketing campaigns for musicians.',
    'Helped artists get their music on major platforms.'
  ]
}

15.times do
  random_category = categories.sample  # Randomly select a category from the list
  creator_artist = CreatorArtist.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
    category: random_category,
    image_url: Faker::Internet.url,
    description: category_descriptions[random_category].sample  # Select a random description from the corresponding category
  )
  creator_artist.save!
end
