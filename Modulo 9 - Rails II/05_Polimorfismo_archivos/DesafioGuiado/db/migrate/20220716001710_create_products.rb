class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :stock
      t.references :category, polymorphic: true, null: false

      t.timestamps
    end
  end
end
