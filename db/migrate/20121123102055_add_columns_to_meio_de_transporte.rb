class AddColumnsToMeioDeTransporte < ActiveRecord::Migration
  def change
  	add_column :meio_transportes, :trajeto_usuario_id, :integer
  	add_column :meio_transportes, :status_id, :integer
  	add_column :meio_transportes, :limite, :boolean, :default => false
  	add_column :meio_transportes, :limite_qtd, :decimal
  	remove_column :meio_transportes, :trajeto_id
  end
end
