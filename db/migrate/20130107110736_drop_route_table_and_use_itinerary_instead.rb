class DropRouteTableAndUseItineraryInstead < ActiveRecord::Migration
  extend MigrationHelper

  def self.up

    drop_table :routes

    create_table(:itineraries) do |t|
      t.string :name, :null => false
      t.string :transport_type
      t.datetime :day, :null => false
      t.datetime :hour, :null => false
      t.string :repeat_in, :default => "day"
      t.string :origin, :null => false
      t.string :destiny, :null => false

      t.timestamps
    end

    remove_column :points, :route_id
    add_column :points, :itinerary_id, :integer

    add_foreign_key(:points, :itinerary_id, :itineraries)

  end

  def self.down
    create_table(:routes) do |t|
      t.string :name, :null => false
      t.string :transport_type, :default => 'walking'
      t.datetime :day, :null => false
      t.datetime :hour, :null => false
      t.string :repeat_in, :default => "day"
      t.string :origin, :null => false
      t.string :destiny, :null => false

      t.timestamps
    end
    add_column :points, :route_id, :integer

    remove_foreign_key(:points, :itinerary_id)
    remove_column :points, :itinerary_id
    drop_table :itineraries
  end
end
