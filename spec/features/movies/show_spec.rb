require "rails_helper"

RSpec.describe "Movies Show Page" do
  
  
  describe '#US 2' do
  it 'displays a movies attribues and sorts actors youngest to oldest' do
    studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    studio2 = Studio.create!(name: "Studio2", location: "Denver")
  
    movie1 = studio1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation") 
    movie2 = studio1.movies.create!(title: "Cars", creation_year: "2004", genre: "animation") 
    movie3 = studio2.movies.create!(title: "King Kong", creation_year: "1990", genre: "fiction") 
  
    actor1 = movie1.actors.create!(name: "Woody", age: 40)
    actor2 = movie1.actors.create!(name: "Buzz", age: 39)
    actor3 = movie1.actors.create!(name: "Mr. Patato", age: 20)
    actor4 = movie2.actors.create!(name: "Woody", age: 40)
    actor5 = movie2.actors.create!(name: "Lightning McQueen", age: 20)
    actor6 = movie3.actors.create!(name: "Kong", age: 60)
      # When I visit a movie's show page.
      visit "/movies/#{movie1.id}"
      # I see the movie's title, creation year, and genre,
      expect(page).to have_content("Movie Name: Toy Story")
      expect(page).to have_content("Year Created: 1995")
      expect(page).to have_content("Genre: animation")
      # and a list of all its actors from youngest to oldest.
      expect(page).to have_content("Actors Name: Mr. Patato")
      expect(page).to have_content("Age: 20")
      expect(page).to have_content("Actors Name: Buzz")
      expect(page).to have_content("Age: 39")
      expect(page).to have_content("Actors Name: Woody")
      expect(page).to have_content("Age: 40")
      
      # And I see the average age of all of the movie's actors
      expect(page).to have_content("The average age of each actory is: 33")

    end
  end

  describe '#Us 3' do
    it 'Adds an actor' do
      # When I visit a movie show page,
      studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")

      movie2 = studio1.movies.create!(title: "Cars", creation_year: "2004", genre: "animation") 
      # I do not see any actors listed that are not part of the movie
      actor1 = Actor.create!(name: "Lightning McQueen", age: 20)
      actor2 = movie2.actors.create!(name: "Mater", age: 25)

      visit "/movies/#{movie2.id}"
      # And I see a form to add an actor to this movie
      expect(page).to have_button("Add Actor")
      fill_in :actor_id, with: actor1.id
      # When I fill in the form with the ID of an actor that exists in the database
      # And I click submit
      click_on("Add Actor")
      # Then I am redirected back to that movie's show page
      expect(current_path).to eq("/movies/#{movie2.id}")
      # And I see the actor's name is now listed
      expect(page).to have_content("Actors Name: Mater")
      expect(page).to have_content("Age: 25")
      # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)
      

    end
  end
end