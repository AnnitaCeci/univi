class AddPlanEstudioRefToAsignatura < ActiveRecord::Migration[5.1]
  def change
    add_reference :asignaturas, :plan_estudio, foreign_key: true
  end
end