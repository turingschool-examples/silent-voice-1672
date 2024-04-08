require "rails_helper"

RSpec.describe "the studios index page" do
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
    @actor_4 = @movie_1.actors.create!(name: 'Actor Name 4', age: 76)
    @actor_5 = @movie_1.actors.create!(name: 'Actor Name 5', age: 50)
  end

  describe 'User Story 1' do
    it "lists all of the studios and their name and location and under each studio it lists all of the studio's movies including the movie's title, creation year and genre" do
      visit '/studios'

      within "#studio_#{@studio_1.id}_info" do
        expect(page).to have_content('Studio Name 1')
        expect(page).to have_content('Location: Location 1')

        within "#studio_#{@studio_1.id}_movies" do

          within "#studio_#{@studio_1.id}_movie_#{@movie_1.id}" do
            expect(page).to have_content('Title: Movie Title 1')
            expect(page).to have_content('Creation Year: 2000')
            expect(page).to have_content('Genre: Movie Genre 1')
          end

          within "#studio_#{@studio_1.id}_movie_#{@movie_2.id}" do
            expect(page).to have_content('Title: Movie Title 2')
            expect(page).to have_content('Creation Year: 2005')
            expect(page).to have_content('Genre: Movie Genre 1')
          end

        expect(page).to_not have_content('Title: Movie Title 5')
        expect(page).to_not have_content('Creation Year: 1974')
        end
      end

      within "#studio_#{@studio_2.id}_info" do
        expect(page).to have_content('Studio Name 2')
        expect(page).to have_content('Location: Location 2')

        within "#studio_#{@studio_2.id}_movies" do

          within "#studio_#{@studio_2.id}_movie_#{@movie_4.id}" do
            expect(page).to have_content('Title: Movie Title 4')
            expect(page).to have_content('Creation Year: 1956')
            expect(page).to have_content('Genre: Movie Genre 3')
          end

          within "#studio_#{@studio_2.id}_movie_#{@movie_5.id}" do
            expect(page).to have_content('Title: Movie Title 5')
            expect(page).to have_content('Creation Year: 1974')
            expect(page).to have_content('Genre: Movie Genre 1')
          end

        expect(page).to_not have_content('Title: Movie Title 1')
        expect(page).to_not have_content('Creation Year: 2000')
        end
      end
    end
  end
end
