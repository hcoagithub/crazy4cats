class CreateAventuras < ActiveRecord::Migration[7.0]
  def change
    create_table :aventuras do |t|
      t.string :titulo
      t.string :descripcion
      t.datetime :fecha
      t.string :imagen
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
