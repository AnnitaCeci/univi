class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.float :parcial1
      t.float :parcial2
      t.float :average
      t.float :extra1
      t.float :extra2
      t.references :alumno, foreign_key: true
      t.references :periodo, foreign_key: true
      t.references :record, foreign_key: true
      t.references :curso, foreign_key: true

      t.timestamps
    end
  end
end
