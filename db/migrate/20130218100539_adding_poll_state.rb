class AddingPollState < ActiveRecord::Migration
  def change
    add_column :polls, :state, :string, :default => 'active', :limit => 10
  end
end
