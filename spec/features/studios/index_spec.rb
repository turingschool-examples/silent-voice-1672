require 'rails_helper'

RSpec.describe "Studio Index" do
  before(:each) do
    @studio_1 = Studio.create!(name: "IGN", location: "Las Vagas")
    @studio_2 = Studio.create!(name: "Universal Studios", location: "Hollywood")

    @movie_1 = Movie.create!(title: "Bad Boys", creation_year: "1995", genre: "action", studio_id: @studio_1)
    @movie_2 = Movie.create!(title: "Cars", creation_year: "2006", genre: "comedy", studio_id: @studio_1)
    @movie_3 = Movie.create!(title: "Friends", creation_year: "2010", genre: "romance", studio_id: @studio_2)
    @movie_4 = Movie.create!(title: "Startrek", creation_year: "1989", genre: "si-fi", studio_id: @studio_2)
  end

  describe 'User Story 1' do
    it "displays all of the studios including name and location" do
      visit "/studios"

      expect(page).to have_content(@studio_1.name)
      expect(page).to have_content(@studio_1.location)
      expect(page).to have_content(@studio_2.name)
      expect(page).to have_content(@studio_2.location)
    end

    it "displays all of the studio's movies including the movie's title, creation year, and genre" do
      visit "/studios"

      expect(page).to have_content(@movie_1.title)
      expect(page).to have_content(@movie_1.creation_year)
      expect(page).to have_content(@movie_1.genre)

      expect(page).to have_content(@movie_2.title)
      expect(page).to have_content(@movie_2.creation_year)
      expect(page).to have_content(@movie_2.genre)

      expect(page).to have_content(@movie_3.title)
      expect(page).to have_content(@movie_3.creation_year)
      expect(page).to have_content(@movie_3.genre)

      expect(page).to have_content(@movie_4.title)
      expect(page).to have_content(@movie_4.creation_year)
      expect(page).to have_content(@movie_4.genre)
    end
  end
end