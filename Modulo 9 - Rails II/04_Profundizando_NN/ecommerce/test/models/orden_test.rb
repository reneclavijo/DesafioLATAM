require "test_helper"

class OrdenTest < ActiveSupport::TestCase

  test 'Crear un  número al azar cuando creo una orden' do
    # Arrange / Preparar / Asignar
    usuario = Usuario.create(email: "usuario@ejemplo.com", password: "qwerty")
    usuario = usuarios(:usuario01)
    # Act / Actuar / Ejecutar
    orden = Orden.create(usuario_id: usuario.id)
    # Assert  / Afirmar
    assert !orden.numero.nil? # si es diferente de nil
  end

  test 'Número de la orden debe ser único' do
    usuario = Usuario.create(email: 'usuario@ejemplo.com', password: '1q2w3e4r')
    orden = Orden.create(usuario_id: usuario.id)
    orden_duplicada = orden.dup
    assert_not orden_duplicada.valid?
  end

  test 'Agregar producto a la orden' do
    # Preparar
    usuario = Usuario.create(email: 'usuario@correo.com', password: '1q2we34r')
    orden = Orden.create(usuario_id: usuario.id)
    #producto = Producto.create(nombre: 'p1', precio: 100, stock: 8, sku: 'CL001')
    producto = productos(:p1)
    # puts producto.inspect
    # Actuar
    orden.agregar_producto(producto.id, 1)
    # Asertar
    assert_equal orden.detalles_ordenes.count, 1
  end

  test 'No agregar productos con 0 stock' do
    # Preparar
    usuario = Usuario.create(email: 'usuario@correo.com', password: '1q2we34r')
    orden = Orden.create(usuario_id: usuario.id)
    producto_sin_stock = Producto.create(nombre: 'testp1', precio: 1, stock: 0, sku: 'CM003')
    # Actuar / Ejecutar
    orden.agregar_producto(producto_sin_stock.id, 1)
    # Asertar
    assert_equal orden.detalles_ordenes.count, 0
  end

end
