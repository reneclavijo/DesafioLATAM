class CreateDetalleOrden < ActiveRecord::Migration[6.1]
  def change
    create_table :detalles_ordenes do |t|
      t.integer :cantidad
      t.decimal :precio
      t.references :producto, null: false, foreign_key: true
      t.references :orden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
