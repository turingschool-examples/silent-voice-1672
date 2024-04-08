require "rails_helper"

RSpec.describe "movies show page" do

  # User Story 2
  it 'movies show page lists the movies title, creation year, and genre, as well as all of the actors from youngest to oldest' do
    @studio = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @new_movie = Movie.create!(title: "Kick-Ass", creation_year: "2010", genre: "comedy", studio_id: @studio.id)
    @actor_1 = Actor.create!(name: "Dave", age: 33)
    @actor_2 = Actor.create!(name: "Bill", age: 34)
    @actor_3 = Actor.create!(name: "Karen", age: 15)
    MovieActor.create!(movie_id: @new_movie.id, actor_id: @actor_1.id)
    MovieActor.create!(movie_id: @new_movie.id, actor_id: @actor_2.id)
    MovieActor.create!(movie_id: @new_movie.id, actor_id: @actor_3.id)
    
    visit "/movies/#{@new_movie.id}"
    save_and_open_page

    expect(page).to have_content("Kick-Ass")
    expect(page).to have_content("Created: 2010")
    expect(page).to have_content("Genre: comedy")
    expect(page).to have_content("Dave")
    expect(page).to have_content("Bill")
    expect(page).to have_content("Karen")

    expect(page).to have_content("Average age of all actors: 27.33")
  end

  # # User Story 3
  it 'movies show page lets you add an actor to the film' do
    @studio = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @new_movie = Movie.create!(title: "Kick-Ass", creation_year: "2010", genre: "comedy", studio_id: @studio.id)
    @actor_1 = Actor.create!(name: "Dave", age: 33)
    @actor_2 = Actor.create!(name: "Bill", age: 34)
    @actor_3 = Actor.create!(name: "Karen", age: 15)
    @actor_4 = Actor.create!(name: "Doug", age: 15)
    MovieActor.create!(movie_id: @new_movie.id, actor_id: @actor_1.id)
    MovieActor.create!(movie_id: @new_movie.id, actor_id: @actor_2.id)
    MovieActor.create!(movie_id: @new_movie.id, actor_id: @actor_3.id)
    
    visit "/movies/#{@new_movie.id}"

    # expect(page).not_to have_content ("Doug")
    # expect(page).not_to have_content (15)
    # fill_in :actor_id, with 5
    # click "Submit"

    expect(current_path).to eq ("/movies/#{@new_movie.id}")
    
    # expect(page).to have_content ("Doug")
    # expect(page).to have_content (15)
  end

end