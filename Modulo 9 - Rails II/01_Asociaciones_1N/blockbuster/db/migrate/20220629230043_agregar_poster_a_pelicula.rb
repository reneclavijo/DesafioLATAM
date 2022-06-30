class AgregarPosterAPelicula < ActiveRecord::Migration[6.1]
  def change
    #add_column(:nombre_tabla, nombre_columna, :tipo_dato)
    add_column(:movies, :poster, :string)
  end
end
