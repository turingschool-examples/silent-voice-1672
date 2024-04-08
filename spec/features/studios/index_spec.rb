require "rails_helper"

RSpec.describe Studio do
  describe "when I visit the studio index page, then I see all of the studios including name and location" do
    it "and under each studio I see all of the studio's movies; including the movie's title, creation year, and genre" do
      paramount = Studio.create(name: "Paramount Pictures", location: "Los Angeles")
      warner = Studio.create(name: "Warner Bros.", location: "Burbank")
      universal = Studio.create(name: "Universal Pictures", location: "Universal City")

      godfather = Movie.create(title: "The Godfather", creation_year: "1972", genre: "Crime", studio_id: 1)
      shawshank = Movie.create(title: "The Shawshank Redemption", creation_year: "1994", genre: "Drama", studio_id: 2)
      inception = Movie.create(title: "Inception", creation_year: "2010", genre: "Sci-Fi", studio_id: 3)

      visit "/studios"

      expect(page).to have_content(paramount.name)
      expect(page).to have_content(paramount.location)
      expect(page).to have_content(warner.name)
      expect(page).to have_content(warner.location)
      expect(page).to have_content(universal.name)
      expect(page).to have_content(universal.location)

      expect(page).to have_content(godfather.title)
      expect(page).to have_content(godfather.creation_year)
      expect(page).to have_content(godfather.genre)
      expect(page).to have_content(shawshank.title)
      expect(page).to have_content(shawshank.creation_year)
      expect(page).to have_content(shawshank.genre)
      expect(page).to have_content(inception.title)
      expect(page).to have_content(inception.creation_year)
      expect(page).to have_content(inception.genre)
    end
  end

end
