class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :duration
      t.string :category

      t.timestamps
    end
  end
end
