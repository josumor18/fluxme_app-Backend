class CreateProgramacions < ActiveRecord::Migration
  def change
    create_table :programacions do |t|
      t.integer :idUser
      t.integer :idEmisora
      t.string :dia
      t.string :hora
      t.string :titulo

      t.timestamps null: false
    end
  end
end
