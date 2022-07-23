class CreateMetodosPago < ActiveRecord::Migration[6.1]
  def change
    create_table :metodos_pago do |t|
      t.string :nombre
      t.string :codigo

      t.timestamps
    end
  end
end
