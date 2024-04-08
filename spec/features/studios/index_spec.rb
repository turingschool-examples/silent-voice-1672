require 'rails_helper'

RSpec.describe "Studio Index" do
  before :each do
    @universal = Studio.create!(name: "Universal Studios", location: "Los Angeles")
    @nickelodeon = Studio.create!(name: "Nickelodeon Studios", location: "Orlando")

    @indy_day = @universal.movies.create!(title: "Independance Day", creation_year: 1996, genre: "Sci-fy")
    @water_b = @universal.movies.create!(title: "Water Boy", creation_year: 1997, genre: "Comedy")
    @burger = @nickelodeon.movies.create!(title: "Burger movie", creation_year: 2003, genre: "Comedy")
    @scooby = @nickelodeon.movies.create!(title: "Scooby Doo", creation_year: 2017, genre: "Mystery")
  end
  describe "User Story 1" do 
    it 'lists all studios including their name and location' do
      # As a user,
      # When I visit the studio index page,
      visit "/studios"
      # Then I see all of the studios including name and location,
      expect(page).to have_content(@universal.name)
      expect(page).to have_content(@universal.location)
      expect(page).to have_content(@nickelodeon.name)
      expect(page).to have_content(@nickelodeon.location)
    end

    it 'Under each studio it lists all movies including title, creation year, and genre' do
      # As a user,
      # When I visit the studio index page,
      visit "/studios"
      # And under each studio I see all of the studio's movies
      # including the movie's title, creation year, and genre
      within ".studio", text: "Universal" do
        expect(page).to have_content(@indy_day.title)
        expect(page).to have_content(@indy_day.creation_year)
        expect(page).to have_content(@indy_day.genre)
        expect(page).to have_content(@water_b.title)
        expect(page).to have_content(@water_b.creation_year)
        expect(page).to have_content(@water_b.genre)
      end

      within ".studio", text: "Nickelodeon" do
        expect(page).to have_content(@burger.title)
        expect(page).to have_content(@burger.creation_year)
        expect(page).to have_content(@burger.genre)
        expect(page).to have_content(@scooby.title)
        expect(page).to have_content(@scooby.creation_year)
        expect(page).to have_content(@scooby.genre)
      end
    end
  end
end