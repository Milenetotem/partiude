class CreateTrajetoUsuarios < ActiveRecord::Migration
  def change
    create_table :trajeto_usuarios do |t|
      t.integer :trajeto_usuario_origem_id
      t.integer :trajeto_usuario_destino_id
      t.integer :user_id

      t.timestamps
    end
  end
end
