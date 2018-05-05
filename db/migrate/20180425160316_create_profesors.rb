class CreateProfesors < ActiveRecord::Migration[5.1]
  def change
    create_table :profesors do |t|
      t.string :rfc
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :grado_academico
      t.string :grado_academico_abreviado
      t.string :correo
      t.string :telefono
      t.string :domicilio

      t.timestamps
    end
  end
end
