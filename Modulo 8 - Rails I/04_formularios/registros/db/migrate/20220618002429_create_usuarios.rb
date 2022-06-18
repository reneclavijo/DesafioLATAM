class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido
      t.string :correo
      t.string :password
      t.string :color_favorito

      t.timestamps
    end
  end
end
