# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all

@studio1 = Studio.create(name: "MGM", location: "Hollywood")
@studio2 = Studio.create(name: "Universal", location: "Florida")

@movie1 = Movie.create(name: "Toy Story", creation_year: 1995, genre: "animation")
@movie2 = Movie.create(name: "Up", creation_year: 2003, genre: "animation")
@movie3 = Movie.create(name: "Die Hard", creation_year: 1990, genre: "action")
@movie4 = Movie.create(name: "Lord of the Rings", creation_year: 2003, genre: "epic")
@movie5 = Movie.create(name: "Batman", creation_year: 2001, genre: "superhero")

@studio1.movies << [@movie1, @movie5]
@studio2.movies << [@movie2, @movie3, @movie4]