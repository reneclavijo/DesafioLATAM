class Cuenta
  attr_accessor :saldo

  def initialize(saldo = 0)
    @saldo = saldo
  end

  def transferir(monto, cuenta_receptora)
    raise 'Monto insuficiente' if @saldo - monto < 0
    @saldo -= monto # quitando el monto a la que hace el llamado (cuenta1)
    cuenta_receptora.saldo += monto # sumando el monto a la cuenta2
  end
end


cuenta1 = Cuenta.new(5000)
cuenta2 = Cuenta.new(5000)

puts "Saldo cuenta1 #{cuenta1.saldo}"
puts "Saldo cuenta2 #{cuenta2.saldo}"
# cuenta1 esta transfiriendo 5000 a la cuenta2
cuenta1.transferir(5000, cuenta2)
puts "Transferencia exitosa"

puts "Saldo cuenta1 #{cuenta1.saldo}"
puts "Saldo cuenta2 #{cuenta2.saldo}"


cuenta1.transferir(5000, cuenta2)
puts "Transferencia exitosa 2"

puts "Saldo cuenta1 #{cuenta1.saldo}"
puts "Saldo cuenta2 #{cuenta2.saldo}"


class Usuario
  attr_accesor :cuentas, :nombre
  def initialize(nombre, cuentas = [])
    @nombre = nombre
    @cuentas = cuentas
  end
end

# Instanciando un usuario con valores definidos
# nombre: "seb_cr"
# cuentas: [cuenta1, cuenta2]
sebastian = Usuario.new("seb_cr", [cuenta1, cuenta2])

puts sebastian.inspect