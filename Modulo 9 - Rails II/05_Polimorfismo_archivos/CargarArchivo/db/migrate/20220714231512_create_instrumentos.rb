class CreateInstrumentos < ActiveRecord::Migration[6.1]
  def change
    create_table :instrumentos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
