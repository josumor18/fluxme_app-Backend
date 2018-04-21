class RemoveIdcancionFromVotacionesHist < ActiveRecord::Migration
  def change
    remove_column :votaciones_hists, :id_cancion, :integer
  end
end
