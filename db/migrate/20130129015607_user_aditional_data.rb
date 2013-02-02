class UserAditionalData < ActiveRecord::Migration

  def change
    add_column :users, :nickname, :string, :limit => 50
    add_column :users, :name, :string, :limit => 50
    add_column :users, :last_name, :string, :limit => 100
    add_column :users, :address, :string, :limit => 150
    add_column :users, :city, :string, :limit => 20
    add_column :users, :territory, :string, :limit => 20
    add_column :users, :phone, :string, :limit => 15
    add_column :users, :federal_id, :string, :limit => 20
    add_column :users, :subscription_mode, :string, :default => 'free'
  end

end
