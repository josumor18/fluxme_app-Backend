class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :comentarista
      t.text :cuerpo
      t.references :emisora, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
