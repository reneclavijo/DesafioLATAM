require_relative 'cuenta_bancaria'

mi_cuenta = CuentaBancaria.new('Banco de la República', 675849, 10000)
cuenta_emerson = CuentaBancaria.new('Banco Estado', 123000, 5000)

# 🥝si mi cuenta es la que hace la transferencia a emerson
mi_cuenta.transferir(3000, cuenta_emerson)

# 🍎 si emerson transfiere dinero a mi cuenta
# cuenta_emerson.transferir(5000, mi_cuenta) 

puts "Saldo de mi cuenta #{mi_cuenta.saldo}"
puts "Saldo de emerson #{cuenta_emerson.saldo}"


# ================= PRUEBA DEL PUNTO 6 ==============

require_relative 'usuario'

cuenta_ahorros1   = CuentaBancaria.new('Banco Estado', 1234, 5000)
cuenta_ahorros2   = CuentaBancaria.new('Banco Estado', 5678, 1000)
cuenta_corriente1 = CuentaBancaria.new('Banco Estado', 7890, 20000)

cuentas = [cuenta_ahorros1, cuenta_ahorros2, cuenta_corriente1]
cristobal = Usuario.new("cristobal_piedra", cuentas)

puts "Saldo total #{cristobal.saldo_total}"
