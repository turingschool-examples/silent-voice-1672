require "rails_helper"

RSpec.describe "the movies show page" do
  before(:each) do
    @studio_1 = Studio.create!(name: 'Studio Name 1', location: 'Location 1')
    @studio_2 = Studio.create!(name: 'Studio Name 2', location: 'Location 2')
    @studio_3 = Studio.create!(name: 'Studio Name 3', location: 'Location 3')
    @movie_1 = @studio_1.movies.create!(title: 'Movie Title 1', creation_year: '2000', genre: 'Movie Genre 1')
    @movie_2 = @studio_1.movies.create!(title: 'Movie Title 2', creation_year: '2005', genre: 'Movie Genre 1')
    @movie_3 = @studio_1.movies.create!(title: 'Movie Title 3', creation_year: '2015', genre: 'Movie Genre 2')
    @movie_4 = @studio_2.movies.create!(title: 'Movie Title 4', creation_year: '1956', genre: 'Movie Genre 3')
    @movie_5 = @studio_2.movies.create!(title: 'Movie Title 5', creation_year: '1974', genre: 'Movie Genre 1')
    @actor_1 = @movie_1.actors.create!(name: 'Actor Name 1', age: 43)
    @actor_2 = @movie_1.actors.create!(name: 'Actor Name 2', age: 25)
    @actor_3 = @movie_1.actors.create!(name: 'Actor Name 3', age: 30)
    @actor_4 = @movie_4.actors.create!(name: 'Actor Name 4', age: 76)
    @actor_5 = @movie_4.actors.create!(name: 'Actor Name 5', age: 50)
  end

  describe 'User Story 2' do
    it "lists the movies title, creation year and genre and lists all of its actors from youngest to oldest and shows an average age of all of the movie's actors" do
      visit "/movies/#{@movie_1.id}"

      expect(page).to have_content('Movie Title 1')
      expect(page).to have_content('Creation Year: 2000')
      expect(page).to have_content('Genre: Movie Genre 1')

      expect(page).to_not have_content('Movie Title 2')

      within '#movie_actors' do
        expect('Actor Name 2').to appear_before('Actor Name 3')
        expect('Actor Name 3').to appear_before('Actor Name 1')

        expect(page).to have_content('Average Actor Age: 32.67')

        expect(page).to_not have_content('Actor Name 4')
      end
    end
  end
end