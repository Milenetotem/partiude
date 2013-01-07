class ChangeItineraryHourFieldToString < ActiveRecord::Migration
  def up
    change_column :itineraries, :hour, :string
  end

  def down
    remove_column :itineraries, :hour
    add_column :itineraries, :hour, :datetime
  end
end
