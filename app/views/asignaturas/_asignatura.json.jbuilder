json.extract! asignatura, :id, :nombre, :clave, :creditos, :horas, :semester_id, :plan_estudio_id, :created_at, :updated_at
json.url asignatura_url(asignatura, format: :json)
