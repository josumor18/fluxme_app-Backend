class CreateTrendings < ActiveRecord::Migration
  def change
    create_table :trendings do |t|
      t.integer :id_emisora
      t.integer :posicion
      t.string :cancion
      t.string :artista
      t.string :imagen

      t.timestamps null: false
    end
  end
end
