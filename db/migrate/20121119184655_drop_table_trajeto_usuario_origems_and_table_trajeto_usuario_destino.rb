class DropTableTrajetoUsuarioOrigemsAndTableTrajetoUsuarioDestino < ActiveRecord::Migration
  def up
  	drop_table :trajeto_usuario_origems
  	drop_table :trajeto_usuario_destinos


  end

  def down
  end
end
