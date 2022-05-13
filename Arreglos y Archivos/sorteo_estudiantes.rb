estudiantes = [
    "alex",
    #"andres",
    #"cristina",
    #"cristobal",
    "german",
    "gilberto",
    "josé luis",
    #"miguel rivas",
    "nicolás",
    #"pilar",
    #"rodrigo",
    #"ruben",
    #"sebastian labarca",
    "sebastian cortes"
]

tiempo = 30
while tiempo >= 0
    puts estudiantes.sample
    system("clear")
    sleep(0.1)
    tiempo -= 1
end

puts "EL GANADOR ES:"
puts "-".center(20, "*")
puts "#{estudiantes.sample} 🎉🎈"
puts "-".center(20, "*")
puts "participaron #{estudiantes.count} estudiantes:".center(20, "-")
print estudiantes
puts
