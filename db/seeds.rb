# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@us = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
@a24 = Studio.create!(name: 'A24', location: 'Vancover')
@lg = Studio.create!(name: 'Lions Gate', location: 'San Francisco')

@movie_1 = @us.movies.create!(title: 'Kick-Ass', creation_year: 2010, genre: "Comedy")
@movie_2 = @us.movies.create!(title: 'Scott Pilgrim vs. the World', creation_year: 2010, genre: "RomCom")
@movie_3 = @a24.movies.create!(title: 'Ex Machina', creation_year: 2015, genre: "Thriller")
@movie_4 = @a24.movies.create!(title: 'Moonlight', creation_year: 2016, genre: "Drama")
@movie_5 = @lg.movies.create!(title: 'John Wick: Chapter 4', creation_year: 2023, genre: "Action")
@movie_6 = @lg.movies.create!(title: 'The Hunger Games: The Ballad of Songbirds & Snakes', creation_year: 2023)

@actor_1 = @movie_1.actors.create!(name: 'Chloe Grace Moretz', age: 27)
@actor_2 = @movie_1.actors.create!(name: 'Omari Hardwick', age: 50)
@actor_3 = @movie_2.actors.create!(name: 'Michael Cera', age: 35)