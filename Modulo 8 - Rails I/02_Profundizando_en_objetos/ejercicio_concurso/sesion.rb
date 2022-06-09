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

    pregunta2 = VerderoFalso.new('La palta es una fruta')
    pregunta2.configurar(:primera)
    @@preguntas.push pregunta2

    pregunta3 = VerderoFalso.new('¿El agua moja?')
    pregunta3.configurar(:segundo)
    @@preguntas.push pregunta3

    pregunta4 = VerderoFalso.new('Años luz es una medida de tiempo')
    pregunta4.configurar(:segundo)
    @@preguntas.push pregunta4


  end

  def self.generar_cuatro_opciones
    pregunta1 = CuatroOpciones.new('¿Qué animales pueden volar?')
    pregunta1.configurar('Leon', 'Perro', 'Gato', 'Loro', :cuarto)
    @@preguntas.push pregunta1

    pregunta2 = CuatroOpciones.new('¿qué número de pokedex es magicarp?')
    pregunta2.configurar('1', '69', '129', '4', :tercero)
    @@preguntas.push pregunta2

    pregunta3 = CuatroOpciones.new('¿qué número de pokedex es articuno?')
    pregunta3.configurar('144', '34', '12', '7', :primero)
    @@preguntas.push pregunta3

    pregunta4 = CuatroOpciones.new('¿Cuál es el símbolo de Batman?')
    pregunta4.configurar('Una S', 'murciélago', 'Un panda', 'Una pantera', :segundo)
    @@preguntas.push pregunta4

    pregunta2 = CuatroOpciones.new('¿Cual es el mejor pais del mundo?')
    pregunta2.configurar('Chile', 'Colombia', 'Peru', 'Bolivia', :primero)
    @@preguntas.push pregunta2

    pregunta2 = CuatroOpciones.new('¿En qué año se fundó Netflix?')
    pregunta2.configurar('2001', '2009', '2015', '1997', :cuarto)
    @@preguntas.push pregunta2

  end

  def self.crear_preguntas
    generar_verdadero_falso()
    generar_cuatro_opciones()
  end

  def self.comenzar
    @@preguntas.shuffle!
    @@cant_preguntas.times do 
      @@preguntas.pop.jugar
    end
  end
end

