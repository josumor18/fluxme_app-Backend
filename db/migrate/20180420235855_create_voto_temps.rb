class CreateVotoTemps < ActiveRecord::Migration
  def change
    create_table :voto_temps do |t|
      t.integer :id_voto
      t.integer :id_user

      t.timestamps null: false
    end
  end
end
