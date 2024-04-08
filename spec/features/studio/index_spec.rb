require "rails_helper"

RSpec.describe "the studios index" do
  before(:each) do
    Studio.destroy_all
    Movie.destroy_all

    @studio1 = Studio.create(name: "MGM", location: "Hollywood")
    @studio2 = Studio.create(name: "Universal", location: "Florida")

    @movie1 = Movie.create(title: "Toy Story", creation_year: 1995, genre: "animation")
    @movie2 = Movie.create(title: "Up", creation_year: 2003, genre: "animation")
    @movie3 = Movie.create(title: "Die Hard", creation_year: 1990, genre: "action")
    @movie4 = Movie.create(title: "Lord of the Rings", creation_year: 2003, genre: "epic")
    @movie5 = Movie.create(title: "Batman", creation_year: 2001, genre: "superhero")

    @studio1.movies << [@movie1, @movie5]
    @studio2.movies << [@movie2, @movie3, @movie4]
  end

    # As a user,
    # When I visit the studio index page,
    # Then I see all of the studios including name and location,
    # And under each studio I see all of the studio's movies
    # including the movie's title, creation year, and genre
  it "shows each studio's name and location" do
    visit "/studios"

    within "#studio-#{@studio1.id}" do
      expect(page).to have_content("Studio: MGM")
      expect(page).to have_content("Location: Hollywood")
    end

    within "#studio-#{@studio2.id}" do
      expect(page).to have_content("Studio: Universal")
      expect(page).to have_content("Location: Florida")
    end
  end

  it "shows the movies from that studio, including the title, creation year and genre" do

  end
end