json.extract! comentario, :id, :comentarista, :cuerpo, :emisora_id, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
