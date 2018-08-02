class AddCarreraRefToPlanEstudios < ActiveRecord::Migration[5.1]
  def change
    add_reference :plan_estudios, :carrera, foreign_key: true
  end
end
