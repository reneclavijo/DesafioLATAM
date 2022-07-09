class CreateCepas < ActiveRecord::Migration[6.1]
  def change
    create_table :cepas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
