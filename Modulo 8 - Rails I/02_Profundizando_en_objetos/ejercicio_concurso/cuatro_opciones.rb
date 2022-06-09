require_relative 'cuestionario'
require_relative 'opcion'

class CuatroOpciones < Cuestionario
  # Valores de correcto:
  # :primero, :segundo, :tercero, :cuarto
  def configurar(texto_opcion1, texto_opcion2, texto_opcion3, texto_opcion4, correcto)

    opcion1 = Opcion.new(texto_opcion1, correcto == :primero)
    opcion2 = Opcion.new(texto_opcion2, correcto == :segundo)
    opcion3 = Opcion.new(texto_opcion3, correcto == :tercero)
    opcion4 = Opcion.new(texto_opcion4, correcto == :cuarto)

    agregar_opcion(opcion1)
    agregar_opcion(opcion2)
    agregar_opcion(opcion3)
    agregar_opcion(opcion4)
  end
end