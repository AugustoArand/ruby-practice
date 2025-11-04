# Tipos de Conversões
puts "Exemplos de conversões de dados em Ruby"
a = "3.14"
b = a.to_f
c = b.to_i

puts "String original: #{a} - Tipo: #{a.class}"
puts "Float convertido: #{b} - Tipo: #{b.class}"
puts "Integer convertido: #{c} - Tipo: #{c.class}"

puts "O puts é um método que gera uma quebra de linha"

print "O print não gera uma quebra de linha\n"

# O resultado dado pelo método gets.chomp retorna uma string
# Ruby é baseado em tipagem dinâmica
# Importante escrever as constantes em letra maiuscula EX: MINHA_CONSTANTE

puts "Digite um valor"
a = gets.chomp.to_i
puts "Digite outro valor"
b = gets.chomp.to_i

puts a + b
puts a - b
puts a * b
puts a / b
puts a % b
puts a ** b
