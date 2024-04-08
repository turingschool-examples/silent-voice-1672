require "rails_helper"

RSpec.describe "Studio Index Page", type: :feature do
  before :each do
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
  end

  describe "User Story 1" do
    it "Shows all studios" do
      visit "/studios"

      expect(page).to have_content("#{@us.name}")
      expect(page).to have_content("#{@a24.name}")
      expect(page).to have_content("#{@lg.name}")
    end

    it "Shows all movie info for the studio" do
      visit "/studios"

      expect(page).to have_content("#{@movie_1.title}")
      expect(page).to have_content("#{@movie_6.title}")
      expect(page).to have_content("#{@movie_3.creation_year}")
    end
  end
end