class FrascosController < ApplicationController
  def ver
    @saludo_cookie = cookies[:saludo]
    @galleta_cookie = cookies[:galleta]
  end

  def asignar
    cookies[:tarjeta_credito] = "6548 7897 9879 4564 9878"
    cookies[:sabor] = "chirimiya con helado"
    
    cookies.signed[:secreto_firmado] = "chocolate"
    cookies.encrypted[:secreto_cifrado] = "chocolate"
  end

  def borrar
    
    cookies.delete(:tarjeta_credito)
    cookies.delete(:sabor)
    cookies.delete(:secreto_firmado)
    cookies.delete(:secreto_cifrado)
  end
end
