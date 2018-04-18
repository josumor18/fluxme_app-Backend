class RemoveCancionFromVoto < ActiveRecord::Migration
  def change
    remove_column :votos, :cancion, :string
  end
end
