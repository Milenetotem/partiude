class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :grupo_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
