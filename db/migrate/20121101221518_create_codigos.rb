class CreateCodigos < ActiveRecord::Migration
  def change
    create_table :codigos do |t|
      t.string :codigo
      t.integer :user_id
      t.integer :empresa_id

      t.timestamps
    end
  end
end
