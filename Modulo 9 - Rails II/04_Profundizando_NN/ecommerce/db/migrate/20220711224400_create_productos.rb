class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :stock
      t.decimal :precio
      t.string :sku

      t.timestamps
    end
  end
end
