class CreateLocalizacionStats < ActiveRecord::Migration
  def change
    create_table :localizacion_stats do |t|
      t.integer :id_user
      t.integer :id_emisora
      t.string :ciudad
      t.string :pais
      t.float :longitud
      t.float :latitud

      t.timestamps null: false
    end
  end
end
