require "rails_helper"

RSpec.describe "the movie show" do
  before(:each) do
    Studio.destroy_all
    Movie.destroy_all
    Actor.destroy_all

    @studio1 = Studio.create(name: "MGM", location: "Hollywood")
    @studio2 = Studio.create(name: "Universal", location: "Florida")

    @movie1 = Movie.create(title: "Toy Story", creation_year: 1995, genre: "animation")
    @movie2 = Movie.create(title: "Up", creation_year: 2003, genre: "animation")
    @movie3 = Movie.create(title: "Die Hard", creation_year: 1990, genre: "action")

    @actor1 = Actor.create(name: "Tom Hanks", age: 60)
    @actor2 = Actor.create(name: "Brad Pitt", age: 66)
    @actor3 = Actor.create(name: "Angelina Jolie", age: 50)
    @actor4 = Actor.create(name: "Meryl Streep", age: 65)

    @studio1.movies << @movie1
    @studio2.movies << [@movie2, @movie3]

    @movie1.actors << [@actor1, @actor3]
    @movie2.actors << [@actor2, @actor4]
    @movie3.actors << [@actor1, @actor4]
  end
    # As a user,
    # When I visit a movie's show page.
    # I see the movie's title, creation year, and genre,
    # and a list of all its actors from youngest to oldest.
    # And I see the average age of all of the movie's actors
  it "shows the movie's title, creation year, and genre" do
    visit "/movies/#{@movie1.id}"

    expect(page).to have_content("Toy Story")
    expect(page).to have_content("Year: 1995")
    expect(page).to have_content("Genre: animation")
    expect(page).to_not have_content("Die Hard")

    visit "/movies/#{@movie3.id}"

    expect(page).to have_content("Die Hard")
    expect(page).to have_content("Year: 1990")
    expect(page).to have_content("Genre: action")
    expect(page).to_not have_content("Toy Story")
  end

  it "shows a list of all the actors in this movie from youngest to oldest" do

  end

  it "shows the average age for all actors in that movie" do

  end
end