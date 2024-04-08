require 'rails_helper'

RSpec.describe 'studios#index', type: :feature do
  before(:each) do
    @studio1 = Studio.create!(name: "Studios California", location: "Beverlly Hills")
    @movie1 = @studio1.movies.create!(title: "Titanic", creation_year: "1998", genre: "Romantic")
    @movie2 = @studio1.movies.create!(title: "The Joker", creation_year: "2015", genre: "Comedy")
    @studio2 = Studio.create!(name: "Studios Tampa", location: "Armenia Av")
    @movie3 = @studio2.movies.create!(title: "Minions", creation_year: "2022", genre: "Comedy")
  end

  # Story 1 - Studio Index
  it "displays all studios with their movies" do
    # As a user,
    # When I visit the studio index page,
    visit "/studios"
    # Then I see all of the studios including name and location,
    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.location)
    expect(page).to have_content(@studio2.name)
    expect(page).to have_content(@studio2.location)
    # And under each studio I see all of the studio's movies
    # including the movie's title, creation year, and genre
    within('.studio', text: @studio1.name) do
      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)
      expect(page).to have_content(@movie2.title)
      expect(page).to have_content(@movie2.creation_year)
      expect(page).to have_content(@movie2.genre)
    end

    within('.studio', text: @studio2.name) do
      expect(page).to have_content(@movie3.title)
      expect(page).to have_content(@movie3.creation_year)
      expect(page).to have_content(@movie3.genre)
    end
  end
end