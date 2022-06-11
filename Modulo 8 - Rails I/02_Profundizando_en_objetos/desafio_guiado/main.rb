# El método occurs_on? debe responder un true o false según corresponda recibiendo
# los argumentos correspondientes descritos.


# ¿Sabías que cuando utilizamos la instrucción puts sobre un object estamos llamando
# implícitamente al método to_s?


# Este método se encuentra definido en la clase Object y lo podemos sobrescribir (polimorfismo)
# para modificar su comportamiento :)


# ● Cada clase tiene un puntaje de 2 puntos.
# El método to_s debe responder de forma distinta para cada objeto (polimorfismo):
#


require_relative 'daily_appointment'

#! puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
#? # Reunión diaria en Desafío Latam sobre Educación a la(s) 8:15.
cita_diaria = DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts cita_diaria

require_relative 'monthly_appointment'

#! puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
#? # Reunión mensual en NASA sobre Aliens el día 23 a la(s) 8:15.
cita_mensual = MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
puts cita_mensual

#! puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
#? # Reunión única en Desafío Latam sobre Trabajo el 4/6/2019 a la(s) 14:30.
require_relative 'one_time_appointment'
cita_de_una_sola_vez = OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts cita_de_una_sola_vez