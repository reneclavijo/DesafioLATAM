require 'rails_helper'

RSpec.describe Product, type: :model do
  
  it "No guardar un producto sin datos" do
    # Arrange / Acomodar / Preparar
    nuevo_producto = Product.new
    # Act / Actuar
    respuesta = nuevo_producto.save
    # Assert / Afirmar
    expect(respuesta).to eq(false)
  end

  it "No deberíamos guardar productos con el mismo nombre" do
    # Preparar
    chocolate = Product.new(name: "ChocoListo", brand: "Fitness")
    chocolate_copia = Product.new(name: "ChocoListo", brand: "Savoy")

    # Actuar
    chocolate.save
    respuesta = chocolate_copia.save

    # Afirmar
    expect(respuesta).to eq(false)    
  end

  it "No deberíamos tener nombres que tengan menos de 2 letras" do
    # Preparar
    producto1 = Product.new(name: 'b', brand: 'P&g')
    producto2 = Product.new(name: 'te', brand: 'P&g')

    # Actuar
    respuesta1 = producto1.save
    respuesta2 = producto2.save

    # Afirmar
    expect(respuesta1).to eq(false)
    expect(respuesta2).to eq(false)
  end

end
