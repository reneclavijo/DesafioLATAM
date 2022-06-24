class CreateCarta < ActiveRecord::Migration[6.1]
  def change
    create_table :carta do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
