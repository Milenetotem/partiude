class CreateRecurrings < ActiveRecord::Migration
  def change
    create_table :recurrings do |t|
      t.string :repeat_in
      t.string :hour
      t.integer :repeat_weekly_interval, :nil => true
      t.datetime :begin_day
      t.references :itinerary

      t.boolean :sunday, :default => false
      t.boolean :monday, :default => false
      t.boolean :tuesday, :default => false
      t.boolean :wednesday, :default => false
      t.boolean :thursday, :default => false
      t.boolean :friday, :default => false
      t.boolean :saturday, :default => false

      t.timestamps
    end
  end
end
