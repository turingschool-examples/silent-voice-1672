require "rails_helper"

RSpec.describe "the studios show page" do
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
    @movie_2.actors << @actor_1
    @movie_2.actors << @actor_5
  end

  describe 'Extension 1' do
    it 'shows the studios name and location and has a unique list of all actors that have worked on any of its movies' do
      visit "/studios/#{@studio_1.id}"

      expect(page).to have_content('Studio Name 1')
      expect(page).to have_content('Location: Location 1')

      within '#studio_actors' do
      # I didn't know how to test that actor name 1 didn't appear twice. Would be curious if there is a way.
        expect(page).to have_content('Actor Name 1')
        expect(page).to have_content('Actor Name 2')
        expect(page).to have_content('Actor Name 3')
        expect(page).to have_content('Actor Name 5')

        expect(page).to_not have_content('Actor Name 4')
      end
    end
  end
end