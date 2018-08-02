class AddSemesterRefToAsignatura < ActiveRecord::Migration[5.1]
  def change
    add_reference :asignaturas, :semester, foreign_key: true
  end
end
