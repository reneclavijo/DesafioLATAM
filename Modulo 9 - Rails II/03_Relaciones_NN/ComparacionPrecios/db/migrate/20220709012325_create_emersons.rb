class CreateEmersons < ActiveRecord::Migration[6.1]
  def change
    create_table :emersons do |t|
      t.string :name

      t.timestamps
    end
  end
end
