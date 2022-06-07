class Residente
  attr_reader :nombre, :telefono, :casa, :mensajes

  def initialize(nombre, telefono, casa)
    @nombre   = nombre
    @telefono = telefono
    @casa     = casa
    @mensajes = {}
    
  end

  def recibir_mensaje(mensaje)
    # llave = persona que lo envío
    # valor = texto
    if @mensajes.key? mensaje.de.nombre # si ya envío un mensaje antes
      @mensajes[mensaje.de.nombre].push mensaje.contenido
    else
      @mensajes[mensaje.de.nombre] = []
      @mensajes[mensaje.de.nombre].push(mensaje.contenido)
    end
      
  end

  def imprimir_mensajes()
    puts "Mensajes del residente #{@nombre}"
    @mensajes.each do |nombre, texto|
      puts "#{nombre}: #{texto}"
    end
  end

end