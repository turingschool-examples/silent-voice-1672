require "rails_helper"

RSpec.describe Studio do
  describe "when I visit a movie's show page, I see the movie's title, creation year, and genre, and a list of all its actors from youngest to oldest" do
    it "and I see the average age of all of the movie's actors" do
      paramount = Studio.create(name: "Paramount Pictures", location: "Los Angeles")
      warner = Studio.create(name: "Warner Bros.", location: "Burbank")
      universal = Studio.create(name: "Universal Pictures", location: "Universal City")

      godfather = Movie.create(title: "The Godfather", creation_year: "1972", genre: "Crime", studio_id: 1)
      shawshank = Movie.create(title: "The Shawshank Redemption", creation_year: "1994", genre: "Drama", studio_id: 2)
      inception = Movie.create(title: "Inception", creation_year: "2010", genre: "Sci-Fi", studio_id: 3)

      tony = Actor.create(name: "Tony Stark", role: "Main character", age: 35, movie_id: 1)
      bruce = Actor.create(name: "Bruce Wayne", role: "Main character", age: 40, movie_id: 2)
      dom = Actor.create(name: "Dom Cobb", role: "Main character", age: 45, movie_id: 3)

      visit "/movies"

      # expect(thing).to eq(thing)
    end
  end

end
