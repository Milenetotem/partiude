class AddItineraryState < ActiveRecord::Migration
  def up
    add_column :itineraries, :state, :string
  end

  def down
    remove_column :itineraries, :state, :string
  end
end
