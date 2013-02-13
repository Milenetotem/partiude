class AddingPollRequestorLocation < ActiveRecord::Migration
  def change
    add_column :polls, :location_point, :string, :null => false, :limit=> 100, :default => ""
  end
end
