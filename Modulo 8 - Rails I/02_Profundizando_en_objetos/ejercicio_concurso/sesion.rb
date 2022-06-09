require_relative 'verdadero_falso'
require_relative 'cuatro_opciones'

class Sesion
  @@cant_preguntas = 3  # variable de clase
  @@preguntas = []      # variable de clase

  def self.cant_preguntas=(valor)
    @@cant_preguntas = valor
  end

  def self.cant_preguntas
    @@cant_preguntas
  end

  def self.generar_verdadero_falso
    pregunta1 = VerderoFalso.new('¿El sol ☀️ sale del OESTE?')
    pregunta1.configurar(:segundo)
    @@preguntas.push pregunta1
    
    pregunta2 = VerderoFalso.new('¿Todos tenemos fecha de cumpleaños?')
    pregunta2.configurar(:primera)
    @@preguntas.push pregunta2
  end

  def self.generar_cuatro_opciones
    pregunta1 = CuatroOpciones.new('¿Qué animales pueden volar?')
    pregunta1.configurar('Leon', 'Perro', 'Gato', 'Loro', :cuarto)
    @@preguntas.push pregunta1


  end

  def self.crear_preguntas
    generar_verdadero_falso()
    generar_cuatro_opciones()
  end

  def self.comenzar
    @@cant_preguntas.times do 
      @@preguntas.pop.jugar
    end
  end
end