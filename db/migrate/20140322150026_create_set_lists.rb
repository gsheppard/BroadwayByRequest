class CreateSetLists < ActiveRecord::Migration
  def change
    create_table :set_lists do |t|
      t.references :performance
      t.references :song

      t.timestamps
    end
  end
end
