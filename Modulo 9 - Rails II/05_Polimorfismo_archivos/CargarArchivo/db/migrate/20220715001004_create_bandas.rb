class CreateBandas < ActiveRecord::Migration[6.1]
  def change
    create_table :bandas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
