class CreateCows < ActiveRecord::Migration[6.1]
  def change
    create_table :cows do |t|

      t.timestamps
    end
  end
end
