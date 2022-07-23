class Animal
    def mover
        raise NotImplementedError, 'No podemos saber cómo se mueve un animal genérico'
    end
end

class Perro < Animal
    def mover
        "Uso mis patas para caminar"
    end
end

perro1 = Perro.new
puts perro1.mover

animal_generico1 = Animal.new
animal_generico1.mover