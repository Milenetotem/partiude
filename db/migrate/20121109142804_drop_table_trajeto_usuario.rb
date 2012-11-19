class DropTableTrajetoUsuario < ActiveRecord::Migration
  def up
  	drop_table :trajeto_usuarios
  end

  def down
  end
end
