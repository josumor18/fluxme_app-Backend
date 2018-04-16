class AddNewValuesToEmisora < ActiveRecord::Migration
  def change
    add_column :emisoras, :descripcion, :string
  end
end
