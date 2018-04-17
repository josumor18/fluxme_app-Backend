json.array!(@votaciones_historicos) do |votaciones_historico|
  json.extract! votaciones_historico, :id, :id_emisora, :cancion, :votos
  json.url votaciones_historico_url(votaciones_historico, format: :json)
end
