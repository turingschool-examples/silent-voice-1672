# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


@studio_1 = Studio.create!(name: 'Studio Name 1', location: 'Location 1')
@studio_2 = Studio.create!(name: 'Studio Name 2', location: 'Location 2')
@studio_3 = Studio.create!(name: 'Studio Name 3', location: 'Location 3')
@movie_1 = @studio_1.movies.create!(title: 'Movie Title 1', creation_year: '2000', genre: 'Movie Genre 1')
@movie_2 = @studio_1.movies.create!(title: 'Movie Title 2', creation_year: '2005', genre: 'Movie Genre 1')
@movie_3 = @studio_1.movies.create!(title: 'Movie Title 3', creation_year: '2015', genre: 'Movie Genre 2')
@movie_4 = @studio_2.movies.create!(title: 'Movie Title 4', creation_year: '1956', genre: 'Movie Genre 3')
@movie_5 = @studio_2.movies.create!(title: 'Movie Title 5', creation_year: '1974', genre: 'Movie Genre 1')
@actor_1 = @movie_1.actors.create!(name: 'Actor Name 1', age: 43)
@actor_2 = @movie_1.actors.create!(name: 'Actor Name 2', age: 25)
@actor_3 = @movie_1.actors.create!(name: 'Actor Name 3', age: 30)
@actor_4 = @movie_1.actors.create!(name: 'Actor Name 4', age: 76)
@actor_5 = @movie_1.actors.create!(name: 'Actor Name 5', age: 50)