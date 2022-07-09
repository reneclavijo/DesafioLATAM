class CreateEnsamblajes < ActiveRecord::Migration[6.1]
  def change
    create_table :ensamblajes do |t|
      t.integer :porcentaje
      t.references :vino, null: false, foreign_key: true
      t.references :cepa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
