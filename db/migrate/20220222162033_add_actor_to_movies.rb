class AddActorToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :actor, foreign_key: true
  end
end
