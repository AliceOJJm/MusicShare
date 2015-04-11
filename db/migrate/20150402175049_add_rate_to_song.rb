class AddRateToSong < ActiveRecord::Migration
  def change
    add_column :songs, :rate, :float, :default => 0.0
  end
end
