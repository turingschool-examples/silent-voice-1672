# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@studio1 = Studio.create!(name: "Studios California", location: "Beverlly Hills")
@movie1 = @studio1.movies.create!(title: "Titanic", creation_year: "1998", genre: "Romantic")
@movie2 = @studio1.movies.create!(title: "The Joker", creation_year: "2015", genre: "Comedy")
@studio2 = Studio.create!(name: "Studios Tampa", location: "Armenia Av")
@movie3 = @studio2.movies.create!(title: "Minions", creation_year: "2022", genre: "Comedy")
