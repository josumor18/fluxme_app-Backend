class CreateVotos < ActiveRecord::Migration
  def change
    create_table :votos do |t|
      t.integer :id_user
      t.integer :id_emisora
      t.string :cancion

      t.timestamps null: false
    end
  end
end
