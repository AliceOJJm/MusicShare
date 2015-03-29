class CreateSongsGenres < ActiveRecord::Migration
  def change
    create_table :songs_genres, id: false do |t|
      t.references :song, null: false, index: true
      t.references :genre, null: false, index: true
      end
  end
end

