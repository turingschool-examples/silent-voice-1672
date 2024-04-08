require "rails_helper"

RSpec.describe "the studio show" do
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
    @actor4 = Actor.create(name: "Meryl Streep", age: 70)

    @studio1.movies << @movie1
    @studio2.movies << [@movie2, @movie3]

    @movie1.actors << [@actor1, @actor3, @actor4]
    @movie2.actors << [@actor2, @actor4]
    @movie3.actors << [@actor1, @actor4]
  end

  it "shows the studio's name and location" do
    visit "/studios/#{@studio2.id}"

    expect(page).to have_content("Studio: Universal")
    expect(page).to have_content("Location: Florida")
  end

  it "shows a unique list of all the actors that have worked on any of this studio's movies" do
    visit "/studios/#{@studio2.id}"
    require 'pry'; binding.pry

    expect(page).to have_content(@actor1.name, count: 1)
    expect(page).to have_content(@actor2.name, count: 1)
    expect(page).to have_content(@actor4.name, count: 1)
    expect(page).to_not have_content("Angelina Jolie")
  end
end