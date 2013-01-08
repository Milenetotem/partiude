class MigratingPointToGeocoder < ActiveRecord::Migration

  def up
    remove_column :points, :lat
    remove_column :points, :long

    add_column :points, :latitute, :string
    add_column :points, :longitude, :string
    add_column :points, :address, :string
  end

  def down
    add_column :points, :lat, :string
    add_column :points, :long, :string

    remove_column :points, :latitute
    remove_column :points, :longitude
    remove_column :points, :address
  end

end
