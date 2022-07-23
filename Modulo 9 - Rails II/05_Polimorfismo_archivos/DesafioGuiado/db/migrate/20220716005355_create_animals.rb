class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.references :breed, polymorphic: true, null: false

      t.timestamps
    end
  end
end
