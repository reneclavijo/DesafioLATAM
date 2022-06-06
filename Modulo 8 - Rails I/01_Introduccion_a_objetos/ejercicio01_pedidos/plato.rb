class Plato
  attr_reader :nombre, :precio # obtener el @nobre y el @precio

  def initialize(nombre, precio)
    @nombre = nombre
    @precio = precio
  end
end