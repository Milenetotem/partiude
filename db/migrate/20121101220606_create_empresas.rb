class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :logo
      t.string :nome
      t.integer :codigo_id
      t.integer :user_id

      t.timestamps
    end
  end
end
