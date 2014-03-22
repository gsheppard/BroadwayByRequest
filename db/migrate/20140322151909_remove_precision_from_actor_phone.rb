class RemovePrecisionFromActorPhone < ActiveRecord::Migration
  def up
    change_column :actors, :phone, :integer
  end

  def down
    change_column :actors, :phone, :integer, precision: 10
  end
end
