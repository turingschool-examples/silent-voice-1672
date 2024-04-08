require "rails_helper" 

RSpec.describe "Studio show page" do
  before(:each) do
    @studio1 = Studio.create!(name: "Universal Studios", location: "Hollywood")
    @studio2 = Studio.create!(name: "Studio2", location: "Denver")

    @movie1 = @studio1.movies.create!(title: "Toy Story", creation_year: "1995", genre: "animation") 
    @movie2 = @studio1.movies.create!(title: "Cars", creation_year: "2004", genre: "animation") 
    @movie3 = @studio2.movies.create!(title: "King Kong", creation_year: "1990", genre: "fiction") 

    @actor = @movie1.actors.create!(name: "Woody", age: 40)
    @actor = @movie2.actors.create!(name: "Woody", age: 40)
    @actor = @movie1.actors.create!(name: "Lightning McQueen", age: 20)
    @actor = @movie3.actors.create!(name: "Kong", age: 60)
  end

  describe '#US 1' do
    it 'sees each studion and movies they have' do

      # When I visit the studio index page,
      visit "/studios"
      # Then I see all of the studios including name and location,
      expect(page).to have_content("Universal Studios")
      expect(page).to have_content("Hollywood")
      expect(page).to have_content("Studio2")
      expect(page).to have_content("Denver")
      # And under each studio I see all of the studio's movies
      expect(page).to have_content("Toy Story")
      expect(page).to have_content("1995")
      expect(page).to have_content("animation")
      expect(page).to have_content("Cars")
      expect(page).to have_content("2004")
      expect(page).to have_content("animation")
      expect(page).to have_content("King Kong")
      expect(page).to have_content("1990")
      expect(page).to have_content("fiction")
      # including the movie's title, creation year, and genre

    end
  end
end