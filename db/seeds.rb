# seeds.rb

# Studios
@studio1 = Studio.create(name: "Paramount Pictures", location: "Los Angeles, California")
@studio2 = Studio.create(name: "Warner Bros. Pictures", location: "Burbank, California")
@studio3 = Studio.create(name: "Universal Pictures", location: "Universal City, California")

# Movies
@godfather = Movie.create(title: "The Godfather", creation_year: "1972", genre: "Crime", studio: @studio1)
@dark_knight = Movie.create(title: "The Dark Knight", creation_year: "2008", genre: "Action", studio: @studio2)
@jurassic_park = Movie.create(title: "Jurassic Park", creation_year: "1993", genre: "Adventure", studio: @studio3)

# Actors
@marlon_brando = Actor.create(name: "Marlon Brando", age: 80)
@heath_ledger = Actor.create(name: "Heath Ledger", age: 28)
@sam_neill = Actor.create(name: "Sam Neill", age: 72)

# ActorMovies (Associations)
ActorMovie.create(actor: @marlon_brando, movie: @godfather)
ActorMovie.create(actor: @heath_ledger, movie: @dark_knight)
ActorMovie.create(actor: @sam_neill, movie: @jurassic_park)
