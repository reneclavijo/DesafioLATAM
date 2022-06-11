require_relative 'appointment'

class DailyAppointment < Appointment
  def occurs_on?(hour, min)
  end

  def to_s # Esto es el polimorfismo
    "Reunión diaria en #{@location}
    sobre #{@purpose}
    a la(s) #{@hour}:#{@min}"
  end
end
