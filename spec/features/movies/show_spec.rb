require 'rails_helper'

RSpec.describe "Movie Show" do
  before :each do
    @universal = Studio.create!(name: "Universal Studios", location: "Los Angeles")
    @nickelodeon = Studio.create!(name: "Nickelodeon Studios", location: "Orlando")

    @indy_day = @universal.movies.create!(title: "Independance Day", creation_year: 1996, genre: "Sci-fy")
    @water_b = @universal.movies.create!(title: "Water Boy", creation_year: 1997, genre: "Comedy")
    @burger = @nickelodeon.movies.create!(title: "Burger movie", creation_year: 2003, genre: "Comedy")
    @scooby = @nickelodeon.movies.create!(title: "Scooby Doo", creation_year: 2017, genre: "Mystery")

    @adam = Actor.create!(name: "Adam Sandler", age: 28)
    @woman = Actor.create!(name: "Girlfriend", age: 24)

    @movie_actor_1 = MovieActor.create!(movie_id: @water_b.id, actor_id: @adam.id)
    @movie_actor_2 = MovieActor.create!(movie_id: @water_b.id, actor_id: @woman.id)
  end

  describe "User Story 2" do
    it 'shows movie attributes, lists actors from youngest to olders, and shows actors average age' do
      # As a user,
      # When I visit a movie's show page.
      visit "movies/#{@water_b.id}"
      # I see the movie's title, creation year, and genre,
      expect(page).to have_content("#{@water_b.title}")
      expect(page).to have_content("Movie creation year: #{@water_b.creation_year}")
      expect(page).to have_content("Movie genre: #{@water_b.genre}")
      # and a list of all its actors from youngest to oldest.
      within ".actors" do
        expect(@woman.name).to appear_before(@adam.name)
      end
      expect(page).to have_content("Movie actors average age: 26")
      # And I see the average age of all of the movie's actors
    end
  end
end