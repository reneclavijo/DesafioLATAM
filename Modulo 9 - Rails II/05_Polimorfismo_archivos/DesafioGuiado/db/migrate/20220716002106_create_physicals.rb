class CreatePhysicals < ActiveRecord::Migration[6.1]
  def change
    create_table :physicals do |t|

      t.timestamps
    end
  end
end
