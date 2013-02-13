class AddParticipantPendingAprovalState < ActiveRecord::Migration
  def change
    add_column :participants, :participation, :string, :default => 'pending'
  end
end
