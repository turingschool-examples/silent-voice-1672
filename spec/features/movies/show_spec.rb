require "rails_helper"

RSpec.describe "movie show page" do
  before(:each) do
    @studio = Studio.create!(
      name: "Warner Bros.",
      location: "Burbank, CA"
    )
    @movie = @studio.movies.create!(
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
    @actor4 = Actor.create!(
      name: "Oscar Isaac",
      age: 45
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
      expect(@actor1.name).to appear_before(@actor2.name)
    end
  end

  it "shows the average age of all actors" do
    visit "movies/#{@movie.id}"

    within "#average-actor-age" do
      expect(page).to have_content(31.67)
    end
  end

  it "has a form to add an actor to the movie" do
    visit "movies/#{@movie.id}"

    expect(page).to have_content("Add an Actor to This Movie")
    expect(find("form")).to have_content("Actor ID:")
    expect(find("form")).to have_field("actor_id")
    expect(find("form")).to have_button("Add")
  end

  it "can add an existing actor to the movie" do
    visit "movies/#{@movie.id}"

    expect(page).to_not have_content(@actor4.name)

    fill_in "actor_id", with: @actor4.id
    click_button "Add"
    expect(page).to have_current_path("/movies/#{@movie.id}")
    expect(page).to have_content(@actor4.name)
  end
end
