class RemoveOwnerFromItinerary < ActiveRecord::Migration
  def up
    remove_column :itineraries, :user_id
  end

  def down
    add_column :itineraries, :user_id, :integer, :null => false
  end
end
