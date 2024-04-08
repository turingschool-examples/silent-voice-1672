# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
studio1 = Studio.create!(
  name: "Warner Bros.",
  location: "Burbank, CA"
)
studio2 = Studio.create!(
  name: "Universal Pictures",
  location: "Universal City, CA"
)
movie1 = studio1.movies.create!(
  title: "Dune",
  creation_year: "2021",
  genre: "Action/Adventure"
)
movie2 = studio1.movies.create!(
  title: "The Matrix",
  creation_year: "1999",
  genre: "Action/Adventure"
)
movie3 = studio2.movies.create!(
  title: "Oppenheimer",
  creation_year: "2023",
  genre: "Thriller"
)
movie4 = studio2.movies.create!(
  title: "Jaws",
  creation_year: "1975",
  genre: "Thriller"
)
actor1 = movie1.actors.create!(
  name: "Timothee Chalamet",
  age: 28
)
actor2 = movie1.actors.create!(
  name: "Rebecca Ferguson",
  age: 40
)
actor3 = movie1.actors.create!(
  name: "Zendaya Coleman",
  age: 27
)
actor4 = Actor.create!(
  name: "Oscar Isaac",
  age: 45
)
