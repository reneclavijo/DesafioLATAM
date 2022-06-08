class CuentaBancaria
  attr_accessor :nombre_de_usuario
  
  def initialize(nombre_usuario, numero_de_cuenta, vip = 0)
    
    raise RangeError, 'Número de cuenta inválido' if numero_de_cuenta.digits.count != 8
    
    @nombre_de_usuario  = nombre_usuario
    @numero_de_cuenta   = numero_de_cuenta
    @vip = vip
  end
  
  def numero_de_cuenta
    "#{@vip}-#{@numero_de_cuenta}"
  end

end

# Cuando creamos una cuenta sin VIP y número de cuenta correcto
cuenta_sebastian_l = CuentaBancaria.new("seb_labarca", 56473829)
puts cuenta_sebastian_l.numero_de_cuenta

# Cuando creamos una cuenta VIP y número de cuenta correcto
cuenta_sebastian_cr = CuentaBancaria.new("seb_cruchaga", 56473829, 1)
puts cuenta_sebastian_cr.numero_de_cuenta

# Cuando creamos una cuenta con número de cuenta incorrecto
cuenta_sebastian_c = CuentaBancaria.new("seb_cortes", 0000)
puts cuenta_sebastian_c.numero_de_cuenta

