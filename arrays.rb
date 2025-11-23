puts "=" * 60
puts "EXEMPLOS DE ARRAYS EM RUBY"
puts "=" * 60

# ========================================
# 1. CRIAÇÃO DE ARRAYS
# ========================================
puts "\n1. CRIAÇÃO DE ARRAYS"
puts "-" * 40

# Diferentes formas de criar arrays
array_vazio = []
array_literal = [1, 2, 3, 4, 5]
array_misto = [1, "dois", 3.0, :quatro, true]
array_new = Array.new(3, 0)  # [0, 0, 0]
array_range = (1..5).to_a    # [1, 2, 3, 4, 5]
array_palavras = %w[ruby python javascript]  # ["ruby", "python", "javascript"]

puts "Array vazio: #{array_vazio.inspect}"
puts "Array literal: #{array_literal.inspect}"
puts "Array misto: #{array_misto.inspect}"
puts "Array.new(3, 0): #{array_new.inspect}"
puts "Range para array: #{array_range.inspect}"
puts "%w[]: #{array_palavras.inspect}"

# ========================================
# 2. ACESSANDO ELEMENTOS
# ========================================
puts "\n2. ACESSANDO ELEMENTOS"
puts "-" * 40

frutas = ["maçã", "banana", "laranja", "uva", "manga"]

puts "Primeiro elemento: #{frutas[0]} ou #{frutas.first}"
puts "Último elemento: #{frutas[-1]} ou #{frutas.last}"
puts "Segundo elemento: #{frutas[1]}"
puts "Penúltimo elemento: #{frutas[-2]}"
puts "Elementos 1 a 3: #{frutas[1..3].inspect}"
puts "Primeiros 3 elementos: #{frutas[0...3].inspect}"
puts "Pegando 2 elementos a partir do índice 2: #{frutas[2, 2].inspect}"

# ========================================
# 3. ADICIONANDO E REMOVENDO ELEMENTOS
# ========================================
puts "\n3. ADICIONANDO E REMOVENDO ELEMENTOS"
puts "-" * 40

numeros = [1, 2, 3]
puts "Array inicial: #{numeros.inspect}"

# Adicionar no final
numeros.push(4)
numeros << 5
puts "Após push(4) e << 5: #{numeros.inspect}"

# Adicionar no início
numeros.unshift(0)
puts "Após unshift(0): #{numeros.inspect}"

# Remover do final
ultimo = numeros.pop
puts "pop() retorna #{ultimo}, array: #{numeros.inspect}"

# Remover do início
primeiro = numeros.shift
puts "shift() retorna #{primeiro}, array: #{numeros.inspect}"

# Remover elemento específico
numeros.delete(3)
puts "Após delete(3): #{numeros.inspect}"

# Remover por índice
numeros.delete_at(1)
puts "Após delete_at(1): #{numeros.inspect}"

# ========================================
# 4. MÉTODOS DE CONSULTA E VERIFICAÇÃO
# ========================================
puts "\n4. MÉTODOS DE CONSULTA E VERIFICAÇÃO"
puts "-" * 40

lista = [10, 20, 30, 40, 50]

puts "Tamanho do array: #{lista.size} ou #{lista.length}"
puts "Array está vazio? #{lista.empty?}"
puts "Array contém 30? #{lista.include?(30)}"
puts "Índice do elemento 40: #{lista.index(40)}"
puts "Contar ocorrências de 20: #{[1, 2, 2, 3, 2].count(2)}"

# ========================================
# 5. ITERAÇÃO E LOOPS
# ========================================
puts "\n5. ITERAÇÃO E LOOPS"
puts "-" * 40

cores = ["vermelho", "verde", "azul"]

print "each: "
cores.each { |cor| print "#{cor} " }
puts

print "each_with_index: "
cores.each_with_index { |cor, indice| print "[#{indice}:#{cor}] " }
puts

print "reverse_each: "
cores.reverse_each { |cor| print "#{cor} " }
puts

# ========================================
# 6. TRANSFORMAÇÃO DE ARRAYS
# ========================================
puts "\n6. TRANSFORMAÇÃO DE ARRAYS"
puts "-" * 40

valores = [1, 2, 3, 4, 5]

# map/collect - transforma cada elemento
dobrados = valores.map { |n| n * 2 }
puts "map (dobrar): #{dobrados.inspect}"

quadrados = valores.collect { |n| n ** 2 }
puts "collect (quadrados): #{quadrados.inspect}"

# select/filter - seleciona elementos que atendem condição
pares = valores.select { |n| n.even? }
puts "select (pares): #{pares.inspect}"

# reject - remove elementos que atendem condição
impares = valores.reject { |n| n.even? }
puts "reject (não pares): #{impares.inspect}"

# compact - remove nils
com_nils = [1, nil, 2, nil, 3]
sem_nils = com_nils.compact
puts "compact: #{com_nils.inspect} => #{sem_nils.inspect}"

# uniq - remove duplicatas
com_duplicatas = [1, 2, 2, 3, 3, 3, 4]
sem_duplicatas = com_duplicatas.uniq
puts "uniq: #{com_duplicatas.inspect} => #{sem_duplicatas.inspect}"

# flatten - achata arrays aninhados
aninhado = [1, [2, 3], [4, [5, 6]]]
achatado = aninhado.flatten
puts "flatten: #{aninhado.inspect} => #{achatado.inspect}"

# ========================================
# 7. REDUÇÃO E AGREGAÇÃO
# ========================================
puts "\n7. REDUÇÃO E AGREGAÇÃO"
puts "-" * 40

nums = [1, 2, 3, 4, 5]

# reduce/inject - reduz array a um único valor
soma = nums.reduce(0) { |acumulador, n| acumulador + n }
puts "reduce (soma): #{soma}"

produto = nums.reduce(1) { |acumulador, n| acumulador * n }
puts "reduce (produto): #{produto}"

# Atalhos para operações comuns
soma_atalho = nums.sum
puts "sum: #{soma_atalho}"

# min, max
puts "Mínimo: #{nums.min}, Máximo: #{nums.max}"
puts "Minmax: #{nums.minmax.inspect}"

# ========================================
# 8. ORDENAÇÃO
# ========================================
puts "\n8. ORDENAÇÃO"
puts "-" * 40

desordenado = [5, 2, 8, 1, 9, 3]
puts "Original: #{desordenado.inspect}"
puts "sort (crescente): #{desordenado.sort.inspect}"
puts "sort (decrescente): #{desordenado.sort.reverse.inspect}"
puts "sort com bloco: #{desordenado.sort { |a, b| b <=> a }.inspect}"

palavras = ["ruby", "python", "java", "c"]
puts "Palavras ordenadas: #{palavras.sort.inspect}"
puts "Por tamanho: #{palavras.sort_by { |p| p.length }.inspect}"

# sort_by com múltiplos critérios
pessoas = [
  { nome: "Ana", idade: 25 },
  { nome: "Bruno", idade: 30 },
  { nome: "Carlos", idade: 25 }
]
ordenadas = pessoas.sort_by { |p| [p[:idade], p[:nome]] }
puts "Pessoas ordenadas por idade e nome:"
ordenadas.each { |p| puts "  #{p[:nome]}, #{p[:idade]} anos" }

# ========================================
# 9. COMBINAÇÃO DE ARRAYS
# ========================================
puts "\n9. COMBINAÇÃO DE ARRAYS"
puts "-" * 40

a = [1, 2, 3]
b = [4, 5, 6]

# Concatenação
puts "Concatenação (+): #{(a + b).inspect}"

# União (sem duplicatas)
c = [3, 4, 5]
puts "União (|): #{(a | c).inspect}"

# Interseção (elementos comuns)
puts "Interseção (&): #{(a & c).inspect}"

# Diferença (elementos em a mas não em c)
puts "Diferença (-): #{(a - c).inspect}"

# zip - combina arrays elemento por elemento
d = ["a", "b", "c"]
e = [1, 2, 3]
puts "zip: #{d.zip(e).inspect}"

# ========================================
# 10. MÉTODOS BOOLEANOS E CHECAGEM
# ========================================
puts "\n10. MÉTODOS BOOLEANOS E CHECAGEM"
puts "-" * 40

idades = [18, 21, 25, 30, 35]

# all? - todos os elementos atendem à condição?
todos_maiores = idades.all? { |i| i >= 18 }
puts "Todos maiores de 18? #{todos_maiores}"

# any? - algum elemento atende à condição?
algum_maior_30 = idades.any? { |i| i > 30 }
puts "Algum maior que 30? #{algum_maior_30}"

# none? - nenhum elemento atende à condição?
nenhum_negativo = idades.none? { |i| i < 0 }
puts "Nenhum negativo? #{nenhum_negativo}"

# one? - exatamente um elemento atende à condição?
um_maior_34 = idades.one? { |i| i > 34 }
puts "Exatamente um maior que 34? #{um_maior_34}"

# ========================================
# 11. PARTICIONAMENTO E AGRUPAMENTO
# ========================================
puts "\n11. PARTICIONAMENTO E AGRUPAMENTO"
puts "-" * 40

numeros_diversos = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# partition - divide em dois arrays baseado em condição
pares_impares = numeros_diversos.partition { |n| n.even? }
puts "partition (pares/ímpares): #{pares_impares.inspect}"

# group_by - agrupa elementos por critério
agrupados = numeros_diversos.group_by { |n| n % 3 }
puts "group_by (resto divisão por 3):"
agrupados.each { |chave, valores| puts "  #{chave} => #{valores.inspect}" }

# take e drop
puts "take(3) - primeiros 3: #{numeros_diversos.take(3).inspect}"
puts "drop(3) - remove 3 primeiros: #{numeros_diversos.drop(3).inspect}"

# take_while e drop_while
puts "take_while (< 6): #{numeros_diversos.take_while { |n| n < 6 }.inspect}"
puts "drop_while (< 6): #{numeros_diversos.drop_while { |n| n < 6 }.inspect}"

# ========================================
# 12. CONVERSÃO E FORMATAÇÃO
# ========================================
puts "\n12. CONVERSÃO E FORMATAÇÃO"
puts "-" * 40

array = ["ruby", "é", "incrível"]

# join - converte array em string
puts "join: '#{array.join}'"
puts "join(' '): '#{array.join(' ')}'"
puts "join('-'): '#{array.join('-')}'"

# to_s vs inspect
puts "to_s: #{array.to_s}"
puts "inspect: #{array.inspect}"

# to_h - converter array de pares para hash
pares = [[:a, 1], [:b, 2], [:c, 3]]
hash = pares.to_h
puts "to_h: #{hash.inspect}"

# ========================================
# 13. MÉTODOS AVANÇADOS
# ========================================
puts "\n13. MÉTODOS AVANÇADOS"
puts "-" * 40

# sample - elemento(s) aleatório(s)
deck = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
puts "sample (1 carta): #{deck.sample}"
puts "sample(5) (5 cartas): #{deck.sample(5).inspect}"

# shuffle - embaralha
puts "shuffle: #{[1, 2, 3, 4, 5].shuffle.inspect}"

# rotate - rotaciona elementos
rotacao = [1, 2, 3, 4, 5]
puts "rotate: #{rotacao.rotate.inspect}"
puts "rotate(2): #{rotacao.rotate(2).inspect}"
puts "rotate(-1): #{rotacao.rotate(-1).inspect}"

# transpose - transpõe matriz
matriz = [[1, 2, 3], [4, 5, 6]]
puts "transpose: #{matriz.inspect} => #{matriz.transpose.inspect}"

# combination e permutation
puts "combination(2): #{[1, 2, 3].combination(2).to_a.inspect}"
puts "permutation(2): #{[1, 2, 3].permutation(2).to_a.inspect}"

# repeated_combination e repeated_permutation
puts "repeated_combination(2): #{[1, 2].repeated_combination(2).to_a.inspect}"

# ========================================
# 14. MODIFICAÇÃO IN-PLACE
# ========================================
puts "\n14. MODIFICAÇÃO IN-PLACE"
puts "-" * 40

# Métodos com ! modificam o array original
original = [3, 1, 4, 1, 5, 9]
puts "Array original: #{original.inspect}"

# sort! - ordena in-place
copia = original.dup
copia.sort!
puts "Após sort!: #{copia.inspect}"

# map! - transforma in-place
copia = original.dup
copia.map! { |n| n * 2 }
puts "Após map! (*2): #{copia.inspect}"

# reverse! - inverte in-place
copia = original.dup
copia.reverse!
puts "Após reverse!: #{copia.inspect}"

# compact!, uniq!, flatten! - também modificam in-place
arr_nils = [1, nil, 2, nil]
arr_nils.compact!
puts "compact!: #{arr_nils.inspect}"

# ========================================
# 15. EXEMPLO PRÁTICO: PROCESSAMENTO DE DADOS
# ========================================
puts "\n15. EXEMPLO PRÁTICO: PROCESSAMENTO DE DADOS"
puts "-" * 40

# Simulando dados de vendas
vendas = [
  { produto: "Notebook", preco: 3500, quantidade: 2 },
  { produto: "Mouse", preco: 50, quantidade: 5 },
  { produto: "Teclado", preco: 150, quantidade: 3 },
  { produto: "Monitor", preco: 800, quantidade: 2 },
  { produto: "Webcam", preco: 200, quantidade: 1 }
]

puts "Dados de Vendas:"
vendas.each do |venda|
  total = venda[:preco] * venda[:quantidade]
  puts "  #{venda[:produto]}: R$ #{venda[:preco]} x #{venda[:quantidade]} = R$ #{total}"
end

# Calcular total de vendas
total_vendas = vendas.reduce(0) do |soma, venda|
  soma + (venda[:preco] * venda[:quantidade])
end
puts "\nTotal de vendas: R$ #{total_vendas}"

# Produtos mais caros que R$ 100
caros = vendas.select { |v| v[:preco] > 100 }
puts "\nProdutos > R$ 100: #{caros.map { |v| v[:produto] }.join(', ')}"

# Ordenar por valor total (desc)
puts "\nRanking por valor total:"
vendas.sort_by { |v| v[:preco] * v[:quantidade] }
      .reverse
      .each_with_index do |venda, i|
        total = venda[:preco] * venda[:quantidade]
        puts "  #{i + 1}. #{venda[:produto]}: R$ #{total}"
      end

puts "\n" + "=" * 60
puts "FIM DOS EXEMPLOS"
puts "=" * 60