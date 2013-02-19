class AddingToPollOriginAndDestinyInsteadOfLocation < ActiveRecord::Migration
  def up
    remove_column :polls, :location_point
    add_column :polls, :origin, :string, :limit=> 100, :default => ""
    add_column :polls, :destiny, :string, :limit=> 100, :default => ""
  end

  def down
    add_column :polls, :location_point, :string, :limit=> 100, :default => ""
    remove_column :polls, :origin
    remove_column :polls, :destiny
  end
end
