class RemoveCodigoFromInstituicaos < ActiveRecord::Migration
  def up
    remove_column :instituicaos, :codigos
  end

  def down
    add_column :instituicaos, :codigos, :string
  end
end
