class Comida
  attr_reader :tipo, :valor

  def initialize # inicializa el objeto con datos
    numero = rand(1..2)
    if numero == 1
      @tipo = :chocolate
    else
      @tipo = :fruta
    end

    if numero == 1
      @valor = rand(1..10) * -1
    else
      @valor = rand(1..10)
    end
  end
end