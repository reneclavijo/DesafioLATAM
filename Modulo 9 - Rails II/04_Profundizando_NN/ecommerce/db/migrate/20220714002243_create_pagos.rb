class CreatePagos < ActiveRecord::Migration[6.1]
  def change
    create_table :pagos do |t|
      t.string :estado
      t.decimal :total
      t.string :token
      t.references :orden, null: false, foreign_key: true
      t.references :metodo_pago, null: false, foreign_key: true

      t.timestamps
    end
  end
end
