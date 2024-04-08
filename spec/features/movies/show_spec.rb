require "rails_helper"

RSpec.describe "movie show page" do
  before(:each) do
    @studio = Studio.create!(
      name: "Warner Bros.",
      location: "Burbank, CA"
    )
    @movie = @studio1.movies.create!(
      title: "Dune",
      creation_year: "2021",
      genre: "Action/Adventure"
    )
    @actor1 = @movie.actors.create!(
      name: "Timothee Chalamet",
      age: 28
    )
    @actor2 = @movie.actors.create!(
      name: "Rebecca Ferguson",
      age: 40
    )
    @actor3 = @movie.actors.create!(
      name: "Zendaya Coleman",
      age: 27
    )
  end

  it "shows the movie's title, creation year, and genre" do
    visit "movies/#{@movie.id}"

    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)
  end

  it "lists all actors from youngest to oldest" do
    visit "movies/#{@movie.id}"

    within "#actors-list" do
      expect(@actor3.name).to appear_before(@actor1.name)
      expect(@actor3.age).to appear_before(@actor1.age)
      expect(@actor1.name).to appear_before(@actor2.name)
      expect(@actor1.age).to appear_before(@actor2.age)
    end
  end

  it "shows the average age of all actors" do
    visit "movies/#{@movie.id}"

    within "#average-actor-age" do
      expect(page).to have_content(31.67)
    end
  end
end
