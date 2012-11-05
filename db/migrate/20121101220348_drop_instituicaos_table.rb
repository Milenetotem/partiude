class DropInstituicaosTable < ActiveRecord::Migration
  def up
  	drop_table :instituicaos
  end

  def down
  end
end
