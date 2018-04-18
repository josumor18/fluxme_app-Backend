class AddIdCancionToVoto < ActiveRecord::Migration
  def change
    add_column :votos, :id_cancion, :integer
  end
end
