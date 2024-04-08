require "rails_helper"

RSpec.describe "Movies Show Page" do
  before(:each) do
    @studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio2 = Studio.create!(name: "Studio2", location: "Denver")

    @movie1 = @studio1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation") 
    @movie2 = @studio1.movies.create!(title: "Cars", creation_year: "2004", genre: "animation") 
    @movie3 = @studio2.movies.create!(title: "King Kong", creation_year: "1990", genre: "fiction") 

    @actor = @movie1.actors.create!(name: "Woody", age: 40)
    @actor = @movie1.actors.create!(name: "Buzz", age: 39)
    @actor = @movie1.actors.create!(name: "Mr. Patato", age: 20)
    @actor = @movie2.actors.create!(name: "Woody", age: 40)
    @actor = @movie2.actors.create!(name: "Lightning McQueen", age: 20)
    @actor = @movie3.actors.create!(name: "Kong", age: 60)
  end

  describe '#US 2' do
    it 'displays a movies attribues and sorts actors youngest to oldest' do
      # When I visit a movie's show page.
      visit "/movies/#{@movie1.id}"
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
end