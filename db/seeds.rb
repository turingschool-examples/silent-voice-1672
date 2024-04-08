# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Studio.create!(name: "Universal Studios", location: "Hollywood")
Studio.create!(name: "Disney", location: "Burbank")

Movie.create!(title: "Kick-Ass", creation_year: "2010", genre: "comedy", studio_id: 1)
Movie.create!(title: "Get Out", creation_year: "2017", genre: "horror", studio_id: 1)
Movie.create!(title: "Toy Story", creation_year: "1995", genre: "animation", studio_id: 2)
Movie.create!(title: "Finding Nemo", creation_year: "2003", genre: "animation", studio_id: 2)

Actor.create!(name: "Actor 1", age: 33)
Actor.create!(name: "Actor 2", age: 34)
Actor.create!(name: "Actor 3", age: 15)
Actor.create!(name: "Actor 4", age: 45)

MovieActor.create!(movie_id: 1, actor_id: 1)
MovieActor.create!(movie_id: 1, actor_id: 2)
MovieActor.create!(movie_id: 2, actor_id: 1)
MovieActor.create!(movie_id: 3, actor_id: 3)
MovieActor.create!(movie_id: 4, actor_id: 1)
MovieActor.create!(movie_id: 1, actor_id: 3)
MovieActor.create!(movie_id: 2, actor_id: 4)
MovieActor.create!(movie_id: 3, actor_id: 4)
MovieActor.create!(movie_id: 4, actor_id: 2)
