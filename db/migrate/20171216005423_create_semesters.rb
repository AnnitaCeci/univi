class CreateSemesters < ActiveRecord::Migration[5.0]
  def change
    create_table :semesters do |t|
      t.integer :clave
      t.string :nombre

      t.timestamps
    end
  end
end
