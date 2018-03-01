class CreateAsignaturas < ActiveRecord::Migration[5.0]
  def change
    create_table :asignaturas do |t|
      t.string :nombre
      t.string :clave
      t.integer :creditos
      t.integer :horas

      t.timestamps
    end
  end
end
