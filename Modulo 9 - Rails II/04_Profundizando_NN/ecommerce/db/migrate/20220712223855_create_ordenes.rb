class CreateOrdenes < ActiveRecord::Migration[6.1]
  def change
    create_table :ordenes do |t|
      t.references :usuario, null: false, foreign_key: true
      t.string :numero
      t.decimal :total
      t.string :estado

      t.timestamps
    end
  end
end
