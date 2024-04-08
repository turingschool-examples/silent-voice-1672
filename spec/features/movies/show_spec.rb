require 'rails_helper'

RSpec.describe "Movie Show Page" do
  before :each do
    @studio1 = Studio.create(name: "Paramount Pictures", location: "Los Angeles, California")
    @godfather = Movie.create(title: "The Godfather", creation_year: "1972", genre: "Crime", studio: @studio1)

    @marlon_brando = Actor.create(name: "Marlon Brando", age: 50)
    @al_pacino = Actor.create(name: "Al Pacino", age: 40)
    @robert_de_niro = Actor.create(name: "Robert De Niro", age: 60)

    @godfather.actors << [@marlon_brando, @al_pacino, @robert_de_niro]
  end

  describe 'user story 2' do
    it 'shows the movies title, creation year, and genre' do
      visit "/movies/#{@godfather.id}"

      
    end

    it 'has a list of all its actors from youngest to oldest' do
      visit "/movies/#{@godfather.id}"


    end

    it 'shows the average age of all of the movies actors' do
      visit "/movies/#{@godfather.id}"


    end
  end
end