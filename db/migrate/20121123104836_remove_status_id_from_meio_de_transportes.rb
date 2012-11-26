class RemoveStatusIdFromMeioDeTransportes < ActiveRecord::Migration
  def change
  	remove_column :meio_transportes, :status_id
  end

end
