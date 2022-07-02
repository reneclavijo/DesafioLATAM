class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.integer :attendance
      t.date :date
      t.integer :capacity
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
