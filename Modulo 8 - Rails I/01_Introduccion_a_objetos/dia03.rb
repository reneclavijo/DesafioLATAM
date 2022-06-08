class Persona
  attr_accesor :nombre
end

p1 = Persona.new
p1.@nombre = "Jorge"

class Mascota
  attr_reader :tipo
end

m1 = Mascota.new
m1.tipo = :perro

class Libro
  atrr_accesor :ISBN, :titulo

  def mostrar_info
  end
end
