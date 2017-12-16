json.extract! asignatura, :id, :nombre, :clave, :creditos, :horas, :created_at, :updated_at
json.url asignatura_url(asignatura, format: :json)
