class CreatingRoutes < ActiveRecord::Migration
  def change
    create_table(:routes) do |t|
      t.string :name, :null => false
      t.string :transport_type, :default => 'walking'
      t.datetime :day, :null => false
      t.datetime :hour, :null => false
      t.string :repeat_in, :default => "day"

      t.timestamps
    end
  end
end
