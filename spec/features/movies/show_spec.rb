require 'rails_helper'

RSpec.describe "Movie Show" do
  before :each do
    @universal = Studio.create!(name: "Universal Studios", location: "Los Angeles")
    @nickelodeon = Studio.create!(name: "Nickelodeon Studios", location: "Orlando")

    @indy_day = @universal.movies.create!(title: "Independance Day", creation_year: 1996, genre: "Sci-fy")
    @water_b = @universal.movies.create!(title: "Water Boy", creation_year: 1997, genre: "Comedy")
    @pet_d = @universal.movies.create!(title: "Ace Ventura, Pet Detective", creation_year: 1998, genre: "Comedy")
    @burger = @nickelodeon.movies.create!(title: "Burger movie", creation_year: 2003, genre: "Comedy")
    @scooby = @nickelodeon.movies.create!(title: "Scooby Doo", creation_year: 2017, genre: "Mystery")

    @adam = Actor.create!(name: "Adam Sandler", age: 28)
    @woman = Actor.create!(name: "Girlfriend", age: 24)
    @ace = Actor.create!(name: "Jim Carrey", age: 30)
    @dan = Actor.create!(name: "Dan Marino", age: 34)

    @movie_actor_1 = MovieActor.create!(movie_id: @water_b.id, actor_id: @adam.id)
    @movie_actor_2 = MovieActor.create!(movie_id: @water_b.id, actor_id: @woman.id)
    @movie_actor_3 = MovieActor.create!(movie_id: @pet_d.id, actor_id: @dan.id)
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

  describe "User Story 3" do
    it 'renders a form to add an actor to a movie' do
      # As a user,
      # When I visit a movie show page,
      visit "movies/#{@pet_d.id}"
      # I do not see any actors listed that are not part of the movie
      expect(page).to_not have_content(@ace.name)
      expect(page).to have_content(@dan.name)
      # And I see a form to add an actor to this movie
      # When I fill in the form with the ID of an actor that exists in the database
      fill_in "Actor ID:", with: @ace.id
      # And I click submit
      click_button("Add Actor")
      # Then I am redirected back to that movie's show page
      expect(current_path).to eq("/movies/#{@pet_d.id}")
      # And I see the actor's name is now listed
      expect(page).to have_content(@ace.name)
      # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)
      save_and_open_page
    end
  end
end