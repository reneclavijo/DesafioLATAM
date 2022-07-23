class Animal # clases
    def mover
        raise 'Error'
    end
end

class Rata < Animal
    def mover
        "Corre con sus patitas"
    end
    def roer
        "🦷🦷"
    end
end

class Serpiente < Animal
    def mover
        "Se arrastra con ondas"
    end
end


rata = Rata.new
puts rata.roer
puts rata.mover

animal = Animal.new
# animal.roer
