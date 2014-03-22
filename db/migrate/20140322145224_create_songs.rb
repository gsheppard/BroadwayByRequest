class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.references :musical, null: false

      t.timestamps
    end
  end
end
