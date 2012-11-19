class AddTrajetoUsuarioIdGrupoIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trajeto_usuario_id, :integer
    add_column :users, :grupo_id, :integer
  end
end
