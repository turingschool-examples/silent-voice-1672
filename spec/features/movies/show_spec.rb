require "rails_helper"

RSpec.describe "Movie Show Page", type: :feature do
  before :each do
    @us = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @movie_1 = @us.movies.create!(title: 'Kick-Ass', creation_year: 2010, genre: "Comedy")
    @actor_2 = @movie_1.actors.create!(name: 'Omari Hardwick', age: 50)
    @actor_1 = @movie_1.actors.create!(name: 'Chloe Grace Moretz', age: 27)
    @actor_3 = Actor.create!(name: 'Chadwick Boseman', age: 55)
  end

  describe "show page" do
    it "shoes the movie's title, creation year, and genre" do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)
    end

    it "lists all of its actors youngest to oldest" do
      visit "/movies/#{@movie_1.id}"
      save_and_open_page
      expect(@actor_1.name).to appear_before(@actor_2.name)
    end

    it "shows the average age of the movie's actors" do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content(38.5)
    end

    it "has a form to input actor ID and add it to the movie" do
      visit "/movies/#{@movie_1.id}"
      
      expect(page).to_not have_content(@actor_3.name)
      save_and_open_page
      fill_in "Add Actor(tress) ID:", with: "#{@actor_3.id}"
      click_button "Submit Actor ID"

      expect(page).to have_content(@actor_3.name)
    end
  end
end