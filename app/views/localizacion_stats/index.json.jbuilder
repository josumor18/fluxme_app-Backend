json.array!(@localizacion_stats) do |localizacion_stat|
  json.extract! localizacion_stat, :id, :id_user, :id_emisora, :ciudad, :pais, :longitud, :latitud
  json.url localizacion_stat_url(localizacion_stat, format: :json)
end
