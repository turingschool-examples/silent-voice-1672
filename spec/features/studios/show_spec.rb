require "rails_helper"

RSpec.describe "Studio Show Page", type: :feature do
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
    @actor_5 = @movie_2.actors.create!(name: 'Aubrey Plaza', age: 39)
    @actor_4 = @movie_5.actors.create!(name: 'Chadwick Boseman', age: 43)
    @actor_6 = @movie_2.actors.create!(name: 'Don Cheadle', age: 59)
    @actor_7 = @movie_1.actors.create!(name: 'Don Cheadle', age: 59)
  end

  describe "Extension" do
    it "shows studio name and location" do
      visit "/studios/#{@us.id}"

      expect(page).to have_content("#{@us.name}")
      expect(page).to have_content("#{@us.location}")
      expect(page).to_not have_content("#{@a24.location}")
    end

    it "shows unique list of all the actors that have worked on any of the studio's films" do
      visit "/studios/#{@us.id}"

      expect(page).to have_content("#{@actor_1.name}")
      expect(page).to have_text("#{@actor_6.name}")
    end
  end
end