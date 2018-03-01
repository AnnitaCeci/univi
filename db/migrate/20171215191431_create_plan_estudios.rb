class CreatePlanEstudios < ActiveRecord::Migration[5.0]
  def change
    create_table :plan_estudios do |t|
      t.string :clave
      t.string :semestre
      t.string :inicio_vigencia
      t.string :fin_vigencia

      t.timestamps
    end
  end
end
