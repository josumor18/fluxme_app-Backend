json.array!(@votaciones_hists) do |votaciones_hist|
  json.extract! votaciones_hist, :id, :id_emisora, :cancion, :votos
  json.url votaciones_hist_url(votaciones_hist, format: :json)
end
