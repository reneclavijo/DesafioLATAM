class CreateJuegos < ActiveRecord::Migration[6.1]
  def change
    create_table :juegos do |t|
      t.string :nombre
      t.string :ediciones
      t.datetime :lanzamiento

      t.timestamps
    end
  end
end
