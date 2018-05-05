json.extract! alumno, :id, :clave, :curp, :nombre, :apellido_paterno, :apellido_materno, :correo, :created_at, :updated_at
json.url alumno_url(alumno, format: :json)
