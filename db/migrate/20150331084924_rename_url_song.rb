class RenameUrlSong < ActiveRecord::Migration
  def change
    rename_column :songs, :url, :file
  end
end
