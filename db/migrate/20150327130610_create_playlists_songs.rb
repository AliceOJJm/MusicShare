class CreatePlaylistsSongs < ActiveRecord::Migration
  def change
    create_table :playlists_songs, id: false do |t|
      t.references :playlist, null: false, index: true
      t.references :song, null: false, index: true
    end
  end
end
