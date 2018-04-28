json.extract! profesor, :id, :rfc, :nombre, :apellido_paterno, :apellido_materno, :grado_academico, :grado_academico_abreviado, :correo, :telefono, :domicilio, :created_at, :updated_at
json.url profesor_url(profesor, format: :json)
