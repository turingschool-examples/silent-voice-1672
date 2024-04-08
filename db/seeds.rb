# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@universal = Studio.create!(name: "Universal Studios", location: "Hollywood")
@marvel = Studio.create!(name: "Marvel", location: "BFE")

@ts = @universal.movies.create!(title: "Toy Story", creation_year: 1995, genre: "animation")
@up = @universal.movies.create!(title: "Up", creation_year: 2013)
@superman = @marvel.movies.create!(title: "Superman", creation_year: 2007)
@ironman = @marvel.movies.create!(title: "Ironman", creation_year: 2005)