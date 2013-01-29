class AddItineraryState < ActiveRecord::Migration
  def up
    add_column :itineraries, :state, :string, :default => 'active'
  end

  def down
    remove_column :itineraries, :state
  end
end
