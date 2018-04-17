json.array!(@trendings) do |trending|
  json.extract! trending, :id, :id_emisora, :posicion, :cancion, :artista, :imagen
  json.url trending_url(trending, format: :json)
end
