class Opcion
  attr_reader :texto, :correcto
  def initialize(texto, correcto = false)
    @texto = texto
    @correcto = correcto
  end
end
