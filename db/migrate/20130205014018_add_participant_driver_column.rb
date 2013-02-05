class AddParticipantDriverColumn < ActiveRecord::Migration
  def change
    add_column :participants, :driver, :boolean, :default => false
  end
end
