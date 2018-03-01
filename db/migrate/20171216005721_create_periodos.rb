class CreatePeriodos < ActiveRecord::Migration[5.0]
  def change
    create_table :periodos do |t|
      t.string :nombre
      t.string :inicio
      t.string :fin
      t.string :tipo
      t.boolean :current

      t.timestamps
    end
  end
end
