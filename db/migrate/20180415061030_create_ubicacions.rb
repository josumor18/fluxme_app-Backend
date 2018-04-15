class CreateUbicacions < ActiveRecord::Migration
  def change
    create_table :ubicacions do |t|
      t.integer :id_user
      t.integer :id_emisora
      t.float :longitud
      t.float :latitud

      t.timestamps null: false
    end
  end
end
