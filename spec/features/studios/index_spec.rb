require "rails_helper"

RSpec.describe "the studios index" do
  before(:each) do
    @studio1 = Studio.create!(
      name: "Warner Bros.",
      location: "Burbank, CA"
    )
    @studio2 = Studio.create!(
      name: "Universal Pictures",
      location: "Universal City, CA"
    )
    @movie1 = @studio1.movies.create!(
      title: "Dune",
      creation_year: "2021",
      genre: "Action/Adventure"
    )
    @movie2 = @studio1.movies.create!(
      title: "The Matrix",
      creation_year: "1999",
      genre: "Action/Adventure"
    )
    @movie3 = @studio2.movies.create!(
      title: "Oppenheimer",
      creation_year: "2023",
      genre: "Thriller"
    )
    @movie4 = @studio2.movies.create!(
      title: "Jaws",
      creation_year: "1975",
      genre: "Thriller"
    )
  end

  it "lists all the studio names and locations" do
    visit "/studios"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio1.location)
    expect(page).to have_content(@studio2.name)
    expect(page).to have_content(@studio2.location)
  end

  it "lists the movies for each studio" do
    visit "/studios"

    within "#studio-#{@studio1.id}" do
      expect(page).to have_content(@movie1.title)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)
      expect(page).to have_content(@movie2.title)
      expect(page).to have_content(@movie2.creation_year)
      expect(page).to have_content(@movie2.genre)
    end

    within "#studio-#{@studio2.id}" do
      expect(page).to have_content(@movie3.title)
      expect(page).to have_content(@movie3.creation_year)
      expect(page).to have_content(@movie3.genre)
      expect(page).to have_content(@movie4.title)
      expect(page).to have_content(@movie4.creation_year)
      expect(page).to have_content(@movie4.genre)
    end
  end
end
