class AddMovieReferenceToActors < ActiveRecord::Migration[7.1]
  def change
    add_reference :actors, :movie, null: false, foreign_key: true
  end
end
