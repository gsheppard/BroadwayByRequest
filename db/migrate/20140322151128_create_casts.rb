class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.references :actors, index: true, null: false
      t.references :set_lists, index: true, null: false

      t.timestamps
    end
  end
end
