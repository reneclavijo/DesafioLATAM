class Usuario
  attr_accessor :nombre
  
  # Crear el constructor => initialize 
  # de Usuario que reciba el nombre del usuario y un arreglo con al
  # menos 1 cuenta bancaria
  def initialize(nombre_usuario, cuentas = [])
    @nombre = nombre_usuario
    @cuentas = cuentas
  end
  
  def saldo_total()
    # [
    # 0 | cuenta_ahorros1.saldo   => 5000,
    # 1 | cuenta_ahorros2.saldo   => 1000,
    # 2 | cuenta_corriente1.saldo => 20000,
    # ]
    
    # SUMA TOTAL CON FOR
    # saldo_total = 0
    # for i in 0..@cuentas.length-1 do
    #   saldo_total = saldo_total + @cuentas[i].saldo
    # end
    # # R                      26000
    # return saldo_total

    # LO MISMO PERO CON .map
    saldos = @cuentas.map do |cuenta|
      cuenta.saldo
    end
    saldos.sum

  end
end