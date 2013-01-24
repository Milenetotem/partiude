class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :itinerary
      t.string :content, :null => false, :limit => 150
      t.timestamps
    end
  end
end
