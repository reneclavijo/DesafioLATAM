Producto.destroy_all
Categoria.destroy_all
MetodoPago.delete_all
# Cargando todos los archivos de seeds 
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
