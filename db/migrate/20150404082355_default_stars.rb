class DefaultStars < ActiveRecord::Migration
  def change
    change_column :rates, :stars, :float, :default => 10
  end
end
