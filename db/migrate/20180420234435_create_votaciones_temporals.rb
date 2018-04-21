class CreateVotacionesTemporals < ActiveRecord::Migration
  def change
    create_table :votaciones_temporals do |t|
      t.integer :id_emisora
      t.integer :id_cancion
      t.string :cancion
      t.integer :votos

      t.timestamps null: false
    end
  end
end
