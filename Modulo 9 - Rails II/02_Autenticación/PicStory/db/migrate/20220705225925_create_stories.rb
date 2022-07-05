class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :picture
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
