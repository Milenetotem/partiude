class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.integer :trajeto_grupo_id
      t.integer :user_id
      t.integer :meio_transporte_id
      t.string :nome

      t.timestamps
    end
  end
end
