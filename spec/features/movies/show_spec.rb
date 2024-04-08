require 'rails_helper'

RSpec.describe "Movie#show", type: :feature do
  before(:each) do
    @studio1 = Studio.create!(name: "Studios California", location: "Beverlly Hills")
    @actor1 = Actor.create!(name: "Leonardo DiCaprio", age: 46)
    @actor2 = Actor.create!(name: "Kate Winslet", age: 45)
    @movie1 = @studio1.movies.create!(title: "Titanic", creation_year: "1998", genre: "Romantic")
    @movie_actor_1 = MovieActor.create!(movie_id: @movie1.id, actor_id: @actor1.id)
    @movie_actor_2 = MovieActor.create!(movie_id: @movie1.id, actor_id: @actor2.id)
  end
  
  # Story 2 - Movie Show
  it "displays movie attributes and actors information" do
    # As a user,
    # When I visit a movie's show page.
    visit "/movies/#{@movie1.id}"
    # I see the movie's title, creation year, and genre,
    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie1.creation_year)
    expect(page).to have_content(@movie1.genre)
    # and a list of all its actors from youngest to oldest.
    expect(page).to have_content("Actors:")
    expect(page).to have_content(@actor1.name)
    expect(page).to have_content(@actor2.name)
    # And I see the average age of all of the movie's actors
    expect(page).to have_content("Average Age of Actors: #{@movie1.average_actor_age}")
  end
end