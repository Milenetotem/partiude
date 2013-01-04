class CreatingRoutePoints < ActiveRecord::Migration

  def change
    create_table(:points) do |table|
      table.float :lat, :null => false
      table.float :long, :null => false
      table.string :state, :default => :active
      table.integer :route_id

      table.timestamps
    end
  end

end
