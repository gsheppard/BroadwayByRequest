class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.references :actor, index: true, null: false
      t.references :set_list, index: true, null: false

      t.timestamps
    end
  end
end
