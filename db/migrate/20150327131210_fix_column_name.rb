class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :playlists,
    :name, :title
  end
end
