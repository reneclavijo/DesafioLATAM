class CreateVinos < ActiveRecord::Migration[6.1]
  def change
    create_table :vinos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
