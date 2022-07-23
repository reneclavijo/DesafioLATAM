class CreateDigitals < ActiveRecord::Migration[6.1]
  def change
    create_table :digitals do |t|
      t.string :code

      t.timestamps
    end
  end
end
