class CreateMusicals < ActiveRecord::Migration
  def change
    create_table :musicals do |t|
      t.string :name, null: false
      t.integer :year, precision: 4

      t.timestamps
    end
  end
end
