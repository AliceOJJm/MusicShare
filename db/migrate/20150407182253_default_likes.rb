class DefaultLikes < ActiveRecord::Migration
  def change
    change_column :playlists, :likes, :int, :default => 0
  end
end
