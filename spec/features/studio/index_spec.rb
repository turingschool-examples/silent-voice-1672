require 'rails_helper'

RSpec.describe 'studio index page', type: :feature do
  describe ' USER STORY #1' do
    describe 'as a user when I visit /studios' do
      before(:each) do
        @universal = Studio.create!(name: "Universal Studios", location: "Hollywood")
        @marvel = Studio.create!(name: "Marvel", location: "BFE")

        @ts = @universal.movies.create!(title: "Toy Story", creation_year: 1995, genre: "animation")
        @up = @universal.movies.create!(title: "Up", creation_year: 2013)
        @superman = @marvel.movies.create!(title: "Superman", creation_year: 2007)
        @ironman = @marvel.movies.create!(title: "Ironman", creation_year: 2005)
        visit "/studios"
      end
      it 'displays each studios attributes ' do
        within "#studio-#{@universal.id}" do
        save_and_open_page
          expect(page).to have_content(@universal.name)
          expect(page).to have_content(@universal.location)
        end

        within "#studio-#{@marvel.id}" do
          expect(page).to have_content(@marvel.name)
          expect(page).to have_content(@marvel.location)
        end
      end
      
      it 'displays each studios movies ' do
        within "#studio-#{@universal.id}" do
          expect(page).to have_content(@ts.title)
          expect(page).to have_content(@up.title)
        end

        within "#studio-#{@marvel.id}" do
          expect(page).to have_content(@superman.title)
          expect(page).to have_content(@ironman.title)
        end
      end
    end 
  end
end