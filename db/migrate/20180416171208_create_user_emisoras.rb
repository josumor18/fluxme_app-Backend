class CreateUserEmisoras < ActiveRecord::Migration
  def change
    create_table :user_emisoras do |t|
      t.integer :idUser
      t.integer :idEmisora

      t.timestamps null: false
    end
  end
end
