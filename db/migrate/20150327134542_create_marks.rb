class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :value
      t.references :markable, polymorphic: true, inrex: true
      t.timestamps null: false
    end
  end
end
