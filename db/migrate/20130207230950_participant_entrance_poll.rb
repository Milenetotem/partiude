class ParticipantEntrancePoll < ActiveRecord::Migration

  def change
    create_table :polls do |t|
      t.integer :requestor_id
      t.references :itinerary
      t.timestamps
    end

    create_table :votes do |t|
      t.references :poll
      t.integer :voted_by
      t.boolean :approve
      t.timestamps
    end
  end

end
