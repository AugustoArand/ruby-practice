puts "=" * 70
puts "ITERADORES E MANIPULAÇÃO DE COLEÇÕES EM RUBY"
puts "=" * 70

# ========================================
# 1. EACH - ITERADOR BÁSICO
# ========================================
puts "\n1. EACH - ITERADOR BÁSICO"
puts "-" * 70

# each percorre cada elemento, mas não retorna novo array
numeros = [1, 2, 3, 4, 5]
puts "Array original: #{numeros.inspect}"

print "each (dobro): "
numeros.each { |n| print "#{n * 2} " }
puts

# each com índice
print "each_with_index: "
["a", "b", "c"].each_with_index do |letra, indice|
  print "[#{indice}:#{letra}] "
end
puts

# each com objeto (para rastrear estado)
soma = 0
numeros.each_with_object(soma) { |n, acc| acc += n }
puts "Soma com each_with_object: #{soma}"

# ========================================
# 2. MAP / COLLECT - TRANSFORMAÇÃO
# ========================================
puts "\n2. MAP / COLLECT - TRANSFORMAÇÃO"
puts "-" * 70

# map retorna novo array com elementos transformados
original = [1, 2, 3, 4, 5]
dobrados = original.map { |n| n * 2 }
quadrados = original.map { |n| n ** 2 }

puts "Original: #{original.inspect}"
puts "Dobrados: #{dobrados.inspect}"
puts "Quadrados: #{quadrados.inspect}"

# map com strings
palavras = ["ruby", "python", "javascript"]
maiusculas = palavras.map(&:upcase)
tamanhos = palavras.map(&:length)

puts "\nPalavras: #{palavras.inspect}"
puts "Maiúsculas: #{maiusculas.inspect}"
puts "Tamanhos: #{tamanhos.inspect}"

# map encadeado
resultado = [1, 2, 3].map { |n| n * 2 }.map { |n| n + 10 }
puts "Encadeado: #{resultado.inspect}"

# ========================================
# 3. SELECT / FILTER - FILTRAGEM
# ========================================
puts "\n3. SELECT / FILTER - FILTRAGEM"
puts "-" * 70

# select retorna elementos que atendem à condição
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

pares = numeros.select { |n| n.even? }
impares = numeros.select { |n| n.odd? }
maiores_que_5 = numeros.select { |n| n > 5 }

puts "Números: #{numeros.inspect}"
puts "Pares: #{pares.inspect}"
puts "Ímpares: #{impares.inspect}"
puts "Maiores que 5: #{maiores_que_5.inspect}"

# select com hashes
pessoas = [
  { nome: "Ana", idade: 25 },
  { nome: "Bruno", idade: 17 },
  { nome: "Carlos", idade: 30 },
  { nome: "Diana", idade: 16 }
]

maiores_idade = pessoas.select { |p| p[:idade] >= 18 }
puts "\nMaiores de idade:"
maiores_idade.each { |p| puts "  #{p[:nome]}, #{p[:idade]} anos" }

# ========================================
# 4. REJECT - FILTRAGEM INVERSA
# ========================================
puts "\n4. REJECT - FILTRAGEM INVERSA"
puts "-" * 70

# reject é o oposto de select
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

sem_pares = numeros.reject { |n| n.even? }
menores_ou_igual_5 = numeros.reject { |n| n > 5 }

puts "Números: #{numeros.inspect}"
puts "Sem pares: #{sem_pares.inspect}"
puts "Menores ou igual a 5: #{menores_ou_igual_5.inspect}"

# ========================================
# 5. FIND / DETECT - BUSCAR ELEMENTO
# ========================================
puts "\n5. FIND / DETECT - BUSCAR ELEMENTO"
puts "-" * 70

# find retorna o PRIMEIRO elemento que atende à condição
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

primeiro_par = numeros.find { |n| n.even? }
primeiro_maior_5 = numeros.find { |n| n > 5 }
nao_existe = numeros.find { |n| n > 100 }

puts "Primeiro par: #{primeiro_par}"
puts "Primeiro maior que 5: #{primeiro_maior_5}"
puts "Não existe (>100): #{nao_existe.inspect}"

# find com objetos
produtos = [
  { id: 1, nome: "Notebook", preco: 3000 },
  { id: 2, nome: "Mouse", preco: 50 },
  { id: 3, nome: "Teclado", preco: 150 }
]

produto = produtos.find { |p| p[:id] == 2 }
puts "\nProduto encontrado: #{produto[:nome]} - R$ #{produto[:preco]}"

# ========================================
# 6. REDUCE / INJECT - ACUMULAÇÃO
# ========================================
puts "\n6. REDUCE / INJECT - ACUMULAÇÃO"
puts "-" * 70

# reduce acumula valores em um único resultado
numeros = [1, 2, 3, 4, 5]

soma = numeros.reduce(0) { |acc, n| acc + n }
produto = numeros.reduce(1) { |acc, n| acc * n }
maior = numeros.reduce { |max, n| n > max ? n : max }

puts "Números: #{numeros.inspect}"
puts "Soma: #{soma}"
puts "Produto: #{produto}"
puts "Maior: #{maior}"

# reduce com símbolos
soma_simples = numeros.reduce(:+)
puts "Soma com símbolo: #{soma_simples}"

# Exemplo prático: construir hash
palavras = ["ruby", "python", "java"]
hash = palavras.reduce({}) do |acc, palavra|
  acc[palavra] = palavra.length
  acc
end
puts "\nHash de tamanhos: #{hash.inspect}"

# ========================================
# 7. PARTITION - DIVIDIR EM DOIS GRUPOS
# ========================================
puts "\n7. PARTITION - DIVIDIR EM DOIS GRUPOS"
puts "-" * 70

# partition divide array em [verdadeiros, falsos]
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

pares, impares = numeros.partition { |n| n.even? }
menores, maiores = numeros.partition { |n| n <= 5 }

puts "Números: #{numeros.inspect}"
puts "Pares: #{pares.inspect}, Ímpares: #{impares.inspect}"
puts "<=5: #{menores.inspect}, >5: #{maiores.inspect}"

# ========================================
# 8. GROUP_BY - AGRUPAR POR CRITÉRIO
# ========================================
puts "\n8. GROUP_BY - AGRUPAR POR CRITÉRIO"
puts "-" * 70

# group_by retorna hash com elementos agrupados
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

por_paridade = numeros.group_by { |n| n.even? ? "par" : "ímpar" }
por_resto = numeros.group_by { |n| n % 3 }

puts "Por paridade: #{por_paridade.inspect}"
puts "Por resto (divisão por 3): #{por_resto.inspect}"

# Exemplo prático
pessoas = [
  { nome: "Ana", cidade: "SP" },
  { nome: "Bruno", cidade: "RJ" },
  { nome: "Carlos", cidade: "SP" },
  { nome: "Diana", cidade: "RJ" },
  { nome: "Eduardo", cidade: "MG" }
]

por_cidade = pessoas.group_by { |p| p[:cidade] }
puts "\nPessoas por cidade:"
por_cidade.each do |cidade, lista|
  nomes = lista.map { |p| p[:nome] }.join(", ")
  puts "  #{cidade}: #{nomes}"
end

# ========================================
# 9. SORT / SORT_BY - ORDENAÇÃO
# ========================================
puts "\n9. SORT / SORT_BY - ORDENAÇÃO"
puts "-" * 70

# sort ordena elementos
numeros = [5, 2, 8, 1, 9, 3]
palavras = ["zebra", "macaco", "abelha", "elefante"]

puts "Números ordenados: #{numeros.sort.inspect}"
puts "Palavras ordenadas: #{palavras.sort.inspect}"

# sort_by ordena por critério específico
por_tamanho = palavras.sort_by { |p| p.length }
puts "Por tamanho: #{por_tamanho.inspect}"

# Ordenação múltipla
produtos = [
  { nome: "Mouse", preco: 50 },
  { nome: "Teclado", preco: 150 },
  { nome: "Monitor", preco: 800 },
  { nome: "Webcam", preco: 150 }
]

por_preco = produtos.sort_by { |p| [p[:preco], p[:nome]] }
puts "\nProdutos (por preço e nome):"
por_preco.each { |p| puts "  #{p[:nome]}: R$ #{p[:preco]}" }

# ========================================
# 10. ANY?, ALL?, NONE?, ONE? - PREDICADOS
# ========================================
puts "\n10. ANY?, ALL?, NONE?, ONE? - PREDICADOS"
puts "-" * 70

numeros = [2, 4, 6, 8, 10]

# any? - pelo menos um atende
tem_par = numeros.any? { |n| n.even? }
tem_maior_50 = numeros.any? { |n| n > 50 }

# all? - todos atendem
todos_pares = numeros.all? { |n| n.even? }
todos_positivos = numeros.all? { |n| n > 0 }

# none? - nenhum atende
nenhum_negativo = numeros.none? { |n| n < 0 }
nenhum_maior_100 = numeros.none? { |n| n > 100 }

# one? - exatamente um atende
apenas_um_10 = numeros.one? { |n| n == 10 }

puts "Números: #{numeros.inspect}"
puts "Tem par? #{tem_par}"
puts "Tem maior que 50? #{tem_maior_50}"
puts "Todos pares? #{todos_pares}"
puts "Todos positivos? #{todos_positivos}"
puts "Nenhum negativo? #{nenhum_negativo}"
puts "Apenas um igual a 10? #{apenas_um_10}"

# ========================================
# 11. TAKE, DROP, FIRST, LAST - SUBCONJUNTOS
# ========================================
puts "\n11. TAKE, DROP, FIRST, LAST - SUBCONJUNTOS"
puts "-" * 70

numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

puts "Array: #{numeros.inspect}"
puts "first: #{numeros.first}"
puts "first(3): #{numeros.first(3).inspect}"
puts "last: #{numeros.last}"
puts "last(3): #{numeros.last(3).inspect}"
puts "take(5): #{numeros.take(5).inspect}"
puts "drop(5): #{numeros.drop(5).inspect}"

# take_while e drop_while
puts "take_while (<6): #{numeros.take_while { |n| n < 6 }.inspect}"
puts "drop_while (<6): #{numeros.drop_while { |n| n < 6 }.inspect}"

# ========================================
# 12. ZIP - COMBINAR ARRAYS
# ========================================
puts "\n12. ZIP - COMBINAR ARRAYS"
puts "-" * 70

# zip combina arrays elemento por elemento
nomes = ["Ana", "Bruno", "Carlos"]
idades = [25, 30, 28]
cidades = ["SP", "RJ", "MG"]

combinado = nomes.zip(idades, cidades)
puts "Combinado: #{combinado.inspect}"

# Criar hash com zip
hash = nomes.zip(idades).to_h
puts "Hash: #{hash.inspect}"

# ========================================
# 13. FLAT_MAP / COLLECT_CONCAT - ACHATAR E MAPEAR
# ========================================
puts "\n13. FLAT_MAP / COLLECT_CONCAT - ACHATAR E MAPEAR"
puts "-" * 70

# flat_map mapeia e achata o resultado
numeros = [1, 2, 3]

# map retornaria array aninhado
com_map = numeros.map { |n| [n, n * 2] }
puts "Com map: #{com_map.inspect}"

# flat_map achata automaticamente
com_flat_map = numeros.flat_map { |n| [n, n * 2] }
puts "Com flat_map: #{com_flat_map.inspect}"

# Exemplo prático
pessoas = [
  { nome: "Ana", hobbies: ["ler", "correr"] },
  { nome: "Bruno", hobbies: ["jogar", "cozinhar"] }
]

todos_hobbies = pessoas.flat_map { |p| p[:hobbies] }
puts "Todos os hobbies: #{todos_hobbies.inspect}"

# ========================================
# 14. CYCLE - REPETIR ITERAÇÃO
# ========================================
puts "\n14. CYCLE - REPETIR ITERAÇÃO"
puts "-" * 70

# cycle repete a iteração N vezes
cores = ["vermelho", "verde", "azul"]

print "Cycle 2 vezes: "
cores.cycle(2) { |cor| print "#{cor} " }
puts

# ========================================
# 15. EACH_CONS E EACH_SLICE - JANELAS
# ========================================
puts "\n15. EACH_CONS E EACH_SLICE - JANELAS"
puts "-" * 70

numeros = [1, 2, 3, 4, 5, 6]

# each_cons - janelas deslizantes
puts "each_cons(3) - janelas de 3:"
numeros.each_cons(3) { |grupo| puts "  #{grupo.inspect}" }

# each_slice - fatias consecutivas
puts "\neach_slice(2) - fatias de 2:"
numeros.each_slice(2) { |grupo| puts "  #{grupo.inspect}" }

# ========================================
# 16. CHUNK - AGRUPAR CONSECUTIVOS
# ========================================
puts "\n16. CHUNK - AGRUPAR CONSECUTIVOS"
puts "-" * 70

# chunk agrupa elementos consecutivos
numeros = [1, 2, 2, 3, 3, 3, 4, 4, 5]

agrupados = numeros.chunk { |n| n }.to_a
puts "Chunk por valor: #{agrupados.inspect}"

# Exemplo: agrupar por paridade
sequencia = [1, 3, 5, 2, 4, 6, 7, 9]
por_paridade = sequencia.chunk { |n| n.even? ? "par" : "ímpar" }.to_a
puts "Chunk por paridade: #{por_paridade.inspect}"

# ========================================
# 17. LAZY - ITERAÇÃO PREGUIÇOSA
# ========================================
puts "\n17. LAZY - ITERAÇÃO PREGUIÇOSA"
puts "-" * 70

# lazy adia a execução até ser necessário
# Útil para coleções grandes ou infinitas

numeros = (1..Float::INFINITY).lazy
  .select { |n| n.even? }
  .map { |n| n * 2 }
  .take(5)
  .to_a

puts "5 primeiros pares dobrados: #{numeros.inspect}"

# Sem lazy, isso travaria ou demoraria muito
# Com lazy, processa apenas o necessário

# ========================================
# 18. EXEMPLO PRÁTICO: PROCESSAMENTO DE DADOS
# ========================================
puts "\n18. EXEMPLO PRÁTICO: PROCESSAMENTO DE DADOS"
puts "-" * 70

vendas = [
  { produto: "Notebook", preco: 3500, quantidade: 2, categoria: "eletrônicos" },
  { produto: "Mouse", preco: 50, quantidade: 5, categoria: "eletrônicos" },
  { produto: "Cadeira", preco: 800, quantidade: 3, categoria: "móveis" },
  { produto: "Mesa", preco: 1200, quantidade: 2, categoria: "móveis" },
  { produto: "Teclado", preco: 150, quantidade: 4, categoria: "eletrônicos" }
]

puts "RELATÓRIO DE VENDAS"
puts "=" * 50

# Total de vendas
total_vendas = vendas.reduce(0) do |soma, venda|
  soma + (venda[:preco] * venda[:quantidade])
end
puts "Total em vendas: R$ #{total_vendas}"

# Vendas por categoria
por_categoria = vendas.group_by { |v| v[:categoria] }
puts "\nVendas por categoria:"
por_categoria.each do |categoria, itens|
  total = itens.reduce(0) { |s, v| s + (v[:preco] * v[:quantidade]) }
  puts "  #{categoria.capitalize}: R$ #{total}"
end

# Top 3 produtos mais vendidos (por valor)
top_3 = vendas
  .map { |v| { produto: v[:produto], total: v[:preco] * v[:quantidade] } }
  .sort_by { |v| v[:total] }
  .reverse
  .take(3)

puts "\nTop 3 produtos (por faturamento):"
top_3.each_with_index do |item, i|
  puts "  #{i + 1}. #{item[:produto]}: R$ #{item[:total]}"
end

# Produtos com estoque alto (quantidade > 3)
alto_estoque = vendas
  .select { |v| v[:quantidade] > 3 }
  .map { |v| v[:produto] }

puts "\nProdutos com estoque alto: #{alto_estoque.join(', ')}"

# ========================================
# 19. ENCADEAMENTO DE ITERADORES
# ========================================
puts "\n19. ENCADEAMENTO DE ITERADORES"
puts "-" * 70

numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

resultado = numeros
  .select { |n| n.even? }           # Apenas pares
  .map { |n| n * 3 }                # Multiplicar por 3
  .reject { |n| n > 20 }            # Remover maiores que 20
  .reduce(:+)                       # Somar todos

puts "Números: #{numeros.inspect}"
puts "Pipeline: pares → x3 → remove >20 → soma"
puts "Resultado: #{resultado}"

# ========================================
# 20. COMPARATIVO DE MÉTODOS
# ========================================
puts "\n20. COMPARATIVO DE MÉTODOS"
puts "-" * 70

puts "TRANSFORMAÇÃO:"
puts "  map/collect      → Transforma cada elemento, retorna novo array"
puts "  flat_map         → Mapeia e achata arrays aninhados"

puts "\nFILTRAGEM:"
puts "  select/filter    → Mantém elementos que atendem condição"
puts "  reject           → Remove elementos que atendem condição"
puts "  find/detect      → Retorna PRIMEIRO elemento que atende"

puts "\nAGREGAÇÃO:"
puts "  reduce/inject    → Acumula em valor único"
puts "  sum              → Soma elementos"
puts "  count            → Conta elementos"

puts "\nAGRUPAMENTO:"
puts "  group_by         → Agrupa em hash por critério"
puts "  partition        → Divide em 2 arrays [true, false]"
puts "  chunk            → Agrupa consecutivos"

puts "\nORDENAÇÃO:"
puts "  sort             → Ordena elementos"
puts "  sort_by          → Ordena por critério específico"

puts "\nPREDICADOS:"
puts "  any?             → Pelo menos um atende?"
puts "  all?             → Todos atendem?"
puts "  none?            → Nenhum atende?"
puts "  one?             → Exatamente um atende?"

puts "\n" + "=" * 70
puts "FIM DO RESUMO DE ITERADORES"
puts "=" * 70