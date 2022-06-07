class Mascota
  attr_reader :vida, :accesorios 

  def initialize
    @vida = 20 # quemado el 20
  end

  def correr
    # La función de ejercitarse que es propia de la mascota, debería sumarle a la vida +5 cada vez que sea llamada.
  end

  def comer(comida)
    @vida += comida.valor # 20 += -9 => 11
  end

end