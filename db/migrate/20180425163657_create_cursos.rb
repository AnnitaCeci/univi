class CreateCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :cursos do |t|
      t.references :asignatura, foreign_key: true
      t.references :periodo, foreign_key: true
      t.references :profesor, foreign_key: true

      t.timestamps
    end
  end
end
