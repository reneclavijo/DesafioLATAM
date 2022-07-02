class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :memebers
      t.date :debut
      t.integer :category

      t.timestamps
    end
  end
end
