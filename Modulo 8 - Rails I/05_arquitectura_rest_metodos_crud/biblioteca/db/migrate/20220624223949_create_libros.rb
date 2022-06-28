class CreateLibros < ActiveRecord::Migration[6.1]
  def change
    create_table :libros do |t|
      t.string :titulo
      t.string :autor
      t.integer :estado
      t.date :fecha_prestamo
      t.date :fecha_devolucion

      t.timestamps
    end
  end
end
