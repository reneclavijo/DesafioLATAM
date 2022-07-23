
c1 = Categoria.find_by(nombre: 'Pasteles')
c2 = Categoria.find_by(nombre: 'Galletas')
c3 = Categoria.find_by(nombre: 'Gelatina')

p1 = Producto.create(nombre: 'Torta tres leches', descripcion: 'Descripción2', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK001')
p1.categorias << c1
p1.categorias << c2
p2 = Producto.create(nombre: 'Alfajor', descripcion: 'Descripción2', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK002')
p2.categorias << c1
p2.categorias << c2
p2.categorias << c3
p3 = Producto.create(nombre: 'Ojos de buey', descripcion: 'Descripción3', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK003')
p3.categorias << c1
p4 = Producto.create(nombre: 'Donas', descripcion: 'Descripción4', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK004')
p4.categorias << c2
p4.categorias << c3
p5 = Producto.create(nombre: 'Berlín', descripcion: 'Descripción5', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK005')
p5.categorias << c1
p5.categorias << c3
p6 = Producto.create(nombre: 'Pie de manzana', descripcion: 'Descripción6', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK006')
p6.categorias << c2
p6.categorias << c3
p7 = Producto.create(nombre: 'Galletas bicolor', descripcion: 'Descripción7', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK007')
p7.categorias << c1
p7.categorias << c2
p7.categorias << c3
p8 = Producto.create(nombre: 'Arlequin', descripcion: 'Descripción8', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK008')
p8.categorias << c1
p8.categorias << c2
p8.categorias << c3
p9 = Producto.create(nombre: 'Torta de gelatina', descripcion: 'Descripción9', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK009')
p9.categorias << c1
p9.categorias << c2
p9.categorias << c3
p10 = Producto.create(nombre: 'Torta de Oreo', descripcion: 'Descripción10', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK010')
p10.categorias << c1
p10.categorias << c2
p10.categorias << c3
p11 = Producto.create(nombre: 'Cheescake de mora', descripcion: 'Descripción11', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK011')
p11.categorias << c1
p11.categorias << c2
p11.categorias << c3
p12 = Producto.create(nombre: 'Queque de zanahoria', descripcion: 'Descripción12', stock: rand(6..12), precio: rand(50000..100000), sku: 'AEIK012')
p12.categorias << c1
p12.categorias << c2
p12.categorias << c3
