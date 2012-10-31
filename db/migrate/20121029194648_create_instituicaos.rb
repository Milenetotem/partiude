class CreateInstituicaos < ActiveRecord::Migration
  def change
    create_table :instituicaos do |t|
      t.string :nome
      t.string :logo
      t.string :codigos

      t.timestamps
    end
  end
end
