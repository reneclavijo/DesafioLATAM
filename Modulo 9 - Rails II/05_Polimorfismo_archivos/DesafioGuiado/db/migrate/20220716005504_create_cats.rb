class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|

      t.timestamps
    end
  end
end
