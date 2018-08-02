class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.references :alumno, foreign_key: true
      t.references :periodo, foreign_key: true
      t.references :plan_estudio, foreign_key: true
      t.references :semester, foreign_key: true
      t.integer :studentship
      t.float :average

      t.timestamps
    end
  end
end
