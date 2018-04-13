class CreateEmisoras < ActiveRecord::Migration
  def change
    create_table :emisoras do |t|
      t.string :nombre
      t.string :link
      t.integer :id_admin

      t.timestamps null: false
    end
  end
end
