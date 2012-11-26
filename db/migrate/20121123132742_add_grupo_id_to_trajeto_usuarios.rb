class AddGrupoIdToTrajetoUsuarios < ActiveRecord::Migration
  def change
    add_column :trajeto_usuarios, :grupo_id, :integer
  end
end
