class CreateMixeds < ActiveRecord::Migration[6.1]
  def change
    create_table :mixeds do |t|

      t.timestamps
    end
  end
end
