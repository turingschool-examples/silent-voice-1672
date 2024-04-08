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

@movie1 = Movie.create(title: "Toy Story", creation_year: 1995, genre: "animation")
@movie2 = Movie.create(title: "Up", creation_year: 2003, genre: "animation")
@movie3 = Movie.create(title: "Die Hard", creation_year: 1990, genre: "action")

@actor1 = Actor.create(name: "Tom Hanks", age: 60)
@actor2 = Actor.create(name: "Brad Pitt", age: 66)
@actor3 = Actor.create(name: "Angelina Jolie", age: 50)
@actor4 = Actor.create(name: "Meryl Streep", age: 70)

@studio1.movies << @movie1
@studio2.movies << [@movie2, @movie3]

@movie1.actors << [@actor1, @actor3]
@movie2.actors << [@actor2, @actor4]
@movie3.actors << [@actor1, @actor4]