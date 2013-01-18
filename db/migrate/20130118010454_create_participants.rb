class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :user
      t.references :itinerary

      t.timestamps
    end
  end
end
