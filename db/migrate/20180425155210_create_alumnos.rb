class CreateAlumnos < ActiveRecord::Migration[5.1]
  def change
    create_table :alumnos do |t|
      t.string :clave
      t.string :curp
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :correo

      t.timestamps
    end
  end
end
