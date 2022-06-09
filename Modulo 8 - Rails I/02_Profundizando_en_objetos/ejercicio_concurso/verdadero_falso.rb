require_relative 'cuestionario'
require_relative 'opcion'

class VerderoFalso < Cuestionario
  
  def configurar(correcta = :primera)
    if correcta == :primera
      opcion1 = Opcion.new('Verdadero', true)
      opcion2 = Opcion.new('Falso')
    else
      opcion1 = Opcion.new('Verdadero')
      opcion2 = Opcion.new('Falso', true)
    end
    agregar_opcion(opcion1)
    agregar_opcion(opcion2)
  end
end
