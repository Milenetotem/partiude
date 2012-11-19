class AddEndOrigEndDestLatOrigLongOrigLatDestLongDestToTrajetoUsuarios < ActiveRecord::Migration
  def change
  	add_column :trajeto_usuarios, :end_origem, :string
    add_column :trajeto_usuarios, :end_destino, :string
    add_column :trajeto_usuarios, :long_origem, :float
    add_column :trajeto_usuarios, :lat_origem, :float
	add_column :trajeto_usuarios, :long_destino, :float
    add_column :trajeto_usuarios, :lat_destino, :float
    remove_column :trajeto_usuarios, :latitude
    remove_column :trajeto_usuarios, :longitude
    remove_column :trajeto_usuarios, :address
  end
end
