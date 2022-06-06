# AQUÍ DEJAR CÓDIGO PARA REVISARLO


n = ARGV[0].to_i
c = "*"
valor = c
n.times do |i|
  puts " "*(n-i) + valor + " "
  valor += c*2
  
end

# --- tronco del arbol 

(n/2).times do |i|
  puts " "*(n) + "*"
end

# --- raiz del arbol 

if n%2 == 0 
  print " "*((n/2)-1) + "*"*((n/2))+"*"*((n/2)+2)
else
  print " "*((n/2)+1) + "*"*((n/2))+"*"*((n/2)+1)
end

puts " "