class AddingToParticipantTheirLocation < ActiveRecord::Migration

  def change
    add_column :participants, :origin, :string, :limit=> 100, :default => ""
    add_column :participants, :destiny, :string, :limit=> 100, :default => ""
  end

end
