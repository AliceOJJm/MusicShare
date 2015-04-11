class DefaultRate < ActiveRecord::Migration
  def change
    change_column :users, :rate, :float, :default => 0
  end
end
