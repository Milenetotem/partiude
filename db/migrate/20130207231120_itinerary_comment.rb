class ItineraryComment < ActiveRecord::Migration

  def change
    create_table :comments do |t|
      t.references :user
      t.references :itinerary
      t.string :content, :limit => 150

      t.timestamps
    end
  end

end
