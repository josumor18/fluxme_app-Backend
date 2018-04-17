class CreateCancionesVotars < ActiveRecord::Migration
  def change
    create_table :canciones_votars do |t|
      t.integer :id_emisora
      t.string :cancion

      t.timestamps null: false
    end
  end
end
