class VoteVotedByAttributeRecreated < ActiveRecord::Migration

  def up
    remove_column :votes, :voted_by
    add_column :votes, :user_id, :integer
  end

  def down
    add_column :votes, :voted_by, :integer
    remove_column :votes, :user_id
  end

end
