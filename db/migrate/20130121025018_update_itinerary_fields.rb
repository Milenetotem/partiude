class UpdateItineraryFields < ActiveRecord::Migration
  def up
    remove_column :itineraries, :hour
    remove_column :itineraries, :day
    remove_column :itineraries, :repeat_in

    add_column :itineraries, :recurring_id, :integer
  end

  def down
    remove_column :itineraries, :hour, :string
    remove_column :itineraries, :day, :datetime
    remove_column :itineraries, :repeat_in, :string

    remove_column :itineraries, :recurring_id
  end
end
