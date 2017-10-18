
# 2) Dada una lista de cadenas, donde cada cadena está repetida un número par de veces excepto una
# que está repetida un número impar (o puede salir solo 1 vez qué es impar). Escriba una función en
# cualquier lenguaje de programación que reciba la lista de cadenas y retorna la cadena que sale un
# número impar. Realizar este problema con tiempo de ejecución O(N)

class RepeatedString

  def initialize(list)
    @list = list
  end

  def solution
    @list.each_with_object(Hash.new(0)) { |str, values| values.has_key?(str) ? values.delete(str) : values[str] = str }.keys.first
  end
end

####################
# EXEC
####################
puts "Simple example with three strings: \n"
list = []
3.times do |n|
  puts "Write your string ##{n+1}: "
  list << gets.chomp
end
puts "List => #{list}"

rs = RepeatedString.new(list)
puts "Solution: #{rs.solution}"
