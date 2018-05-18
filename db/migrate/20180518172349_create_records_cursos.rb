class CreateRecordsCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :records_cursos do |t|
      t.references :record, foreign_key: true
      t.references :curso, foreign_key: true
    end

  end
end
