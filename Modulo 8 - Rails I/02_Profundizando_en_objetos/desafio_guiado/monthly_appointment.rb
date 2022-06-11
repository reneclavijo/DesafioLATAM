require_relative 'appointment'

class MonthlyAppointment < Appointment
  attr_reader :day

  def initialize(location, purpose, hour, min, day)
    super(location, purpose, hour, min) # me quedo con la casa y los muebles y traigo mis cosas
    @day = day
  end

  def occurs_on?(day)
  end

  def to_s # Polimorfismo / Botar los muebles por la ventana
    "Reunión mensual en #{@location} sobre #{@purpose}
    el día #{@day} a la(s) #{@hour}:#{@min}."
  end
end