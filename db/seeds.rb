# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

paramount = Studio.create(name: "Paramount Pictures", location: "Los Angeles")
warner = Studio.create(name: "Warner Bros.", location: "Burbank")
universal = Studio.create(name: "Universal Pictures", location: "Universal City")

godfather = Movie.create(title: "The Godfather", creation_year: "1972", genre: "Crime", studio_id: 1)
shawshank = Movie.create(title: "The Shawshank Redemption", creation_year: "1994", genre: "Drama", studio_id: 2)
inception = Movie.create(title: "Inception", creation_year: "2010", genre: "Sci-Fi", studio_id: 3)

tony = Character.create(name: "Tony Stark", role: "Main character", movie_id: 1)
bruce = Character.create(name: "Bruce Wayne", role: "Main character", movie_id: 2)
dom = Character.create(name: "Dom Cobb", role: "Main character", movie_id: 3)
