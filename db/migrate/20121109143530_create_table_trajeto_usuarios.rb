class CreateTableTrajetoUsuarios < ActiveRecord::Migration
  def change
    create_table :trajeto_usuarios do |t|
      t.integer :status_trajeto_id
      t.integer :user_id
      t.integer :meio_transporte_id
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
