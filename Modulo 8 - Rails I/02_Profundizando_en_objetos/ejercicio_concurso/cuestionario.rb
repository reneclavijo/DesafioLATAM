class Cuestionario

  attr_reader :pregunta, :opciones 

  def initialize(pregunta)
    @pregunta = pregunta
    @opciones = []
  end

  def agregar_opcion(opcion)
    raise 'Esto no es una opción válida' if opcion.class != Opcion
    @opciones.push opcion
  end

  def validar_respuesta(opcion)
    @opciones[opcion].correcto
  end

  def configurar
    raise 'No estoy implementado'
  end

  def jugar
    puts "Pregunta: #{@pregunta}"
    
    @opciones.count.times do |index|
      puts "#{index} - #{@opciones[index].texto}"
    end

    puts "Elegir una respuesta"
    opcion = gets.chomp.to_i
    
    if @opciones[opcion].correcto
      puts "Correcto 🥳🎉"
    else 
      puts "Muy mal 💀"
    end
    
  end
end
