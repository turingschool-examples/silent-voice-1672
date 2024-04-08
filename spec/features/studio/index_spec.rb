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
    @movie6 = Movie.create(title: "Dune 2", creation_year: 2024, genre: "epic")

    @studio1.movies << [@movie1, @movie5]
    @studio2.movies << [@movie2, @movie3, @movie4]
  end

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
    visit "/studios"

    within "#studio-#{@studio1.id}" do
      expect(page).to have_content("Title: Toy Story")
      expect(page).to have_content("Year: 1995")
      expect(page).to have_content("Genre: animation")
      expect(page).to have_content("Title: Batman")
      expect(page).to have_content("Year: 2001")
      expect(page).to have_content("Genre: superhero")
    end

    within "#studio-#{@studio2.id}" do
      expect(page).to have_content("Title: Up")
      expect(page).to have_content("Year: 2003")
      expect(page).to have_content("Genre: animation")
      expect(page).to have_content("Title: Die Hard")
      expect(page).to have_content("Year: 1990")
      expect(page).to have_content("Genre: action")
      expect(page).to have_content("Title: Lord of the Rings")
      expect(page).to have_content("Year: 2003")
      expect(page).to have_content("Genre: epic")
    end

    expect(page).to_not have_content("Title: Dune 2")
  end
end