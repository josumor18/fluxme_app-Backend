class CreateVotacionesHistoricos < ActiveRecord::Migration
  def change
    create_table :votaciones_historicos do |t|
      t.integer :id_emisora
      t.string :cancion
      t.integer :votos

      t.timestamps null: false
    end
  end
end
