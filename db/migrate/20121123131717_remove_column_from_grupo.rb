class RemoveColumnFromGrupo < ActiveRecord::Migration
  def up
  	remove_column :grupos, :meio_transporte_id
  end

  def down
  end
end
