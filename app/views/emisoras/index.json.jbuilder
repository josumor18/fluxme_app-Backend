json.array!(@emisoras) do |emisora|
  json.extract! emisora, :id, :nombre, :descripcion, :link, :id_admin
  json.url emisora_url(emisora, format: :json)
end
