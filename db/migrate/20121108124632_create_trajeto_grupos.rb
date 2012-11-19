class CreateTrajetoGrupos < ActiveRecord::Migration
  def change
    create_table :trajeto_grupos do |t|
      t.integer :trajeto_usuario_id
      t.integer :grupo_id

      t.timestamps
    end
  end
end
