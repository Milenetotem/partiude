class CreateMeioTransportes < ActiveRecord::Migration
  def change
    create_table :meio_transportes do |t|
      t.string :icone
      t.string :nome
      t.integer :grupo_id
      t.integer :trajeto_id

      t.timestamps
    end
  end
end
