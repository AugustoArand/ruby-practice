puts "=" * 70
puts "PROCS E LAMBDAS EM RUBY"
puts "=" * 70

# ========================================
# 1. BLOCOS (BLOCKS) - REVISÃO
# ========================================
puts "\n1. BLOCOS (BLOCKS) - REVISÃO"
puts "-" * 70

# Blocos são pedaços de código que podem ser passados para métodos
# Não são objetos, não podem ser salvos em variáveis

[1, 2, 3].each { |n| puts "Número: #{n}" }

# Bloco com do..end (para múltiplas linhas)
[1, 2, 3].each do |n|
  quadrado = n ** 2
  puts "#{n} ao quadrado = #{quadrado}"
end

# ========================================
# 2. PROCS - BLOCOS COMO OBJETOS
# ========================================
puts "\n2. PROCS - BLOCOS COMO OBJETOS"
puts "-" * 70

# Proc transforma um bloco em um objeto que pode ser salvo e reutilizado
saudacao = Proc.new { |nome| puts "Olá, #{nome}!" }

# Chamando o Proc com .call
saudacao.call("João")
saudacao.call("Maria")

# Outras formas de chamar Proc
saudacao["Pedro"]    # Usando []
saudacao.("Ana")     # Usando .()
saudacao === "Carlos" # Usando ===

# Proc com múltiplas linhas
calcular_desconto = Proc.new do |preco, desconto|
  valor_desconto = preco * (desconto / 100.0)
  preco_final = preco - valor_desconto
  puts "Preço: R$ #{preco} | Desconto: #{desconto}% | Final: R$ #{preco_final}"
  preco_final
end

calcular_desconto.call(100, 10)
calcular_desconto.call(250, 20)

# ========================================
# 3. LAMBDAS - PROCS MAIS RIGOROSOS
# ========================================
puts "\n3. LAMBDAS - PROCS MAIS RIGOROSOS"
puts "-" * 70

# Lambda é um tipo especial de Proc com comportamento mais rigoroso
dobrar = lambda { |x| x * 2 }

puts "Lambda dobrar(5): #{dobrar.call(5)}"
puts "Lambda dobrar(10): #{dobrar.call(10)}"

# Sintaxe alternativa com -> (stabby lambda)
triplicar = ->(x) { x * 3 }
puts "Lambda triplicar(5): #{triplicar.call(5)}"

# Lambda com múltiplos parâmetros
somar = ->(a, b) { a + b }
puts "Lambda somar(3, 7): #{somar.call(3, 7)}"

# Lambda com múltiplas linhas
calcular_imc = lambda do |peso, altura|
  imc = peso / (altura ** 2)
  classificacao = case imc
                  when 0..18.5 then "Abaixo do peso"
                  when 18.5..25 then "Peso normal"
                  when 25..30 then "Sobrepeso"
                  else "Obesidade"
                  end
  puts "IMC: #{imc.round(2)} - #{classificacao}"
  imc
end

calcular_imc.call(70, 1.75)
calcular_imc.call(90, 1.80)

# ========================================
# 4. DIFERENÇAS: PROC vs LAMBDA
# ========================================
puts "\n4. DIFERENÇAS: PROC vs LAMBDA"
puts "-" * 70

puts "--- DIFERENÇA 1: Verificação de Argumentos ---"

# Lambda é rigoroso com argumentos
meu_lambda = lambda { |x, y| puts "x=#{x}, y=#{y}" }
meu_proc = Proc.new { |x, y| puts "x=#{x}, y=#{y}" }

puts "Lambda com argumentos corretos:"
meu_lambda.call(1, 2)

puts "\nProc com argumentos corretos:"
meu_proc.call(1, 2)

puts "\nProc com argumentos a menos (aceita e substitui por nil):"
meu_proc.call(1)

puts "\nProc com argumentos a mais (ignora extras):"
meu_proc.call(1, 2, 3, 4)

begin
  puts "\nLambda com argumentos errados (lança erro):"
  meu_lambda.call(1)
rescue ArgumentError => e
  puts "ERRO: #{e.message}"
end

puts "\n--- DIFERENÇA 2: Comportamento do Return ---"

def teste_proc
  meu_proc = Proc.new { return "Retornou do Proc" }
  meu_proc.call
  "Esta linha nunca executa"
end

def teste_lambda
  meu_lambda = lambda { return "Retornou do Lambda" }
  resultado = meu_lambda.call
  "Continuou após lambda: #{resultado}"
end

puts "\nProc com return (sai do método):"
puts teste_proc

puts "\nLambda com return (retorna só do lambda):"
puts teste_lambda

# ========================================
# 5. PASSANDO PROCS E LAMBDAS PARA MÉTODOS
# ========================================
puts "\n5. PASSANDO PROCS E LAMBDAS PARA MÉTODOS"
puts "-" * 70

def executar_3_vezes(proc_ou_lambda)
  3.times do |i|
    puts "Execução #{i + 1}:"
    proc_ou_lambda.call(i + 1)
  end
end

meu_proc = Proc.new { |n| puts "  -> Proc executado com #{n}" }
executar_3_vezes(meu_proc)

puts ""

meu_lambda = lambda { |n| puts "  -> Lambda executado com #{n}" }
executar_3_vezes(meu_lambda)

# ========================================
# 6. CONVERSÃO DE BLOCOS EM PROCS (&)
# ========================================
puts "\n6. CONVERSÃO DE BLOCOS EM PROCS (&)"
puts "-" * 70

# O & converte bloco em Proc
def meu_metodo(&bloco)
  puts "Bloco recebido: #{bloco.class}"
  puts "Chamando o bloco 2 vezes:"
  bloco.call("primeira vez")
  bloco.call("segunda vez")
end

meu_metodo { |msg| puts "  -> Executado #{msg}" }

# Exemplo prático: método map customizado
def meu_map(array, &transformacao)
  resultado = []
  array.each do |elemento|
    resultado << transformacao.call(elemento)
  end
  resultado
end

numeros = [1, 2, 3, 4, 5]
dobrados = meu_map(numeros) { |n| n * 2 }
puts "\nArray original: #{numeros.inspect}"
puts "Array dobrado: #{dobrados.inspect}"

# ========================================
# 7. CONVERTENDO PROCS/LAMBDAS EM BLOCOS (&)
# ========================================
puts "\n7. CONVERTENDO PROCS/LAMBDAS EM BLOCOS (&)"
puts "-" * 70

# Usando & para converter Proc/Lambda em bloco
numeros = [1, 2, 3, 4, 5]

# Criar um lambda para dobrar
dobrar_lambda = ->(n) { n * 2 }

# Converter para bloco com &
resultado = numeros.map(&dobrar_lambda)
puts "Map com lambda: #{resultado.inspect}"

# Exemplo comum: converter símbolo em proc
nomes = ["joão", "maria", "pedro"]
puts "Nomes originais: #{nomes.inspect}"
puts "Nomes capitalizados: #{nomes.map(&:capitalize).inspect}"
puts "Nomes em maiúsculas: #{nomes.map(&:upcase).inspect}"

# ========================================
# 8. CLOSURES - CAPTURANDO VARIÁVEIS
# ========================================
puts "\n8. CLOSURES - CAPTURANDO VARIÁVEIS"
puts "-" * 70

# Procs e Lambdas são closures: capturam variáveis do contexto externo
def criar_contador(inicial = 0)
  contador = inicial
  
  lambda do
    contador += 1
  end
end

contador1 = criar_contador(0)
contador2 = criar_contador(100)

puts "Contador 1:"
puts "  #{contador1.call}"
puts "  #{contador1.call}"
puts "  #{contador1.call}"

puts "Contador 2:"
puts "  #{contador2.call}"
puts "  #{contador2.call}"

# Exemplo prático: multiplicador
def criar_multiplicador(fator)
  lambda { |n| n * fator }
end

dobrar = criar_multiplicador(2)
triplicar = criar_multiplicador(3)
decuplicar = criar_multiplicador(10)

puts "\nMultiplicadores:"
puts "dobrar(5) = #{dobrar.call(5)}"
puts "triplicar(5) = #{triplicar.call(5)}"
puts "decuplicar(5) = #{decuplicar.call(5)}"

# ========================================
# 9. CURRY - APLICAÇÃO PARCIAL
# ========================================
puts "\n9. CURRY - APLICAÇÃO PARCIAL"
puts "-" * 70

# Curry permite aplicar argumentos parcialmente
somar_tres = lambda { |a, b, c| a + b + c }

puts "Lambda normal: #{somar_tres.call(1, 2, 3)}"

# Transformar em curry
somar_curry = somar_tres.curry

# Aplicar argumentos um por vez
adicionar_1 = somar_curry.call(1)
adicionar_1_2 = adicionar_1.call(2)
resultado = adicionar_1_2.call(3)

puts "Curry passo a passo: #{resultado}"
puts "Curry direto: #{somar_curry.call(1).call(2).call(3)}"

# Exemplo prático: desconto
calcular_preco = lambda { |preco, taxa, desconto| 
  preco * (1 + taxa/100.0) * (1 - desconto/100.0) 
}.curry

# Criar função específica para taxa de 10%
com_taxa_10 = calcular_preco.call(100)
puts "\nPreço final com taxa 10% e desconto 5%: R$ #{com_taxa_10.call(10).call(5).round(2)}"

# ========================================
# 10. COMPOSIÇÃO DE FUNÇÕES
# ========================================
puts "\n10. COMPOSIÇÃO DE FUNÇÕES"
puts "-" * 70

# Lambdas podem ser compostos
adicionar_10 = ->(x) { x + 10 }
multiplicar_2 = ->(x) { x * 2 }
elevar_quadrado = ->(x) { x ** 2 }

# Ruby 2.6+ tem composição com << e >>
# composicao = adicionar_10 >> multiplicar_2 >> elevar_quadrado

# Composição manual
def compor(*funcoes)
  lambda do |valor|
    funcoes.reduce(valor) { |resultado, funcao| funcao.call(resultado) }
  end
end

pipeline = compor(adicionar_10, multiplicar_2, elevar_quadrado)
puts "Pipeline (5): #{pipeline.call(5)}"
puts "  5 + 10 = 15"
puts "  15 * 2 = 30"
puts "  30² = 900"

# ========================================
# 11. PROCS E LAMBDAS COM ARRAYS
# ========================================
puts "\n11. PROCS E LAMBDAS COM ARRAYS"
puts "-" * 70

numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Filtros com lambda
par = ->(n) { n.even? }
maior_que_5 = ->(n) { n > 5 }
multiplo_3 = ->(n) { n % 3 == 0 }

puts "Números: #{numeros.inspect}"
puts "Pares: #{numeros.select(&par).inspect}"
puts "Maiores que 5: #{numeros.select(&maior_que_5).inspect}"
puts "Múltiplos de 3: #{numeros.select(&multiplo_3).inspect}"

# Transformações
dobrar = ->(n) { n * 2 }
quadrado = ->(n) { n ** 2 }

puts "\nTransformações:"
puts "Dobrados: #{numeros.map(&dobrar).inspect}"
puts "Quadrados: #{numeros.map(&quadrado).inspect}"

# ========================================
# 12. EXEMPLO PRÁTICO: CALCULADORA
# ========================================
puts "\n12. EXEMPLO PRÁTICO: CALCULADORA"
puts "-" * 70

class Calculadora
  def initialize
    @operacoes = {
      somar: ->(a, b) { a + b },
      subtrair: ->(a, b) { a - b },
      multiplicar: ->(a, b) { a * b },
      dividir: ->(a, b) { b != 0 ? a / b.to_f : "Erro: divisão por zero" },
      potencia: ->(a, b) { a ** b },
      modulo: ->(a, b) { a % b }
    }
  end
  
  def calcular(operacao, a, b)
    if @operacoes.key?(operacao)
      resultado = @operacoes[operacao].call(a, b)
      puts "#{operacao}(#{a}, #{b}) = #{resultado}"
      resultado
    else
      puts "Operação '#{operacao}' não encontrada"
      nil
    end
  end
  
  def adicionar_operacao(nome, lambda_operacao)
    @operacoes[nome] = lambda_operacao
    puts "Operação '#{nome}' adicionada!"
  end
end

calc = Calculadora.new

calc.calcular(:somar, 10, 5)
calc.calcular(:multiplicar, 7, 3)
calc.calcular(:potencia, 2, 8)
calc.calcular(:dividir, 10, 0)

# Adicionar operação customizada
calc.adicionar_operacao(:media, ->(a, b) { (a + b) / 2.0 })
calc.calcular(:media, 10, 20)

# ========================================
# 13. EXEMPLO PRÁTICO: VALIDADORES
# ========================================
puts "\n13. EXEMPLO PRÁTICO: VALIDADORES"
puts "-" * 70

class ValidadorCampo
  attr_reader :nome, :valor, :erros
  
  def initialize(nome, valor)
    @nome = nome
    @valor = valor
    @erros = []
    @validacoes = []
  end
  
  def adicionar_validacao(mensagem, &validacao)
    @validacoes << { mensagem: mensagem, proc: validacao }
    self
  end
  
  def validar
    @erros = []
    @validacoes.each do |validacao|
      unless validacao[:proc].call(@valor)
        @erros << validacao[:mensagem]
      end
    end
    @erros.empty?
  end
  
  def valido?
    validar
  end
  
  def exibir_resultado
    if valido?
      puts "✅ '#{@nome}' válido: #{@valor}"
    else
      puts "❌ '#{@nome}' inválido:"
      @erros.each { |erro| puts "   - #{erro}" }
    end
  end
end

# Validar email
email = ValidadorCampo.new("Email", "usuario@example.com")
email.adicionar_validacao("Não pode ser vazio") { |v| !v.nil? && !v.empty? }
email.adicionar_validacao("Deve conter @") { |v| v.include?("@") }
email.adicionar_validacao("Deve conter .") { |v| v.include?(".") }
email.exibir_resultado

puts ""

# Validar senha
senha = ValidadorCampo.new("Senha", "123")
senha.adicionar_validacao("Mínimo 6 caracteres") { |v| v.length >= 6 }
senha.adicionar_validacao("Deve conter número") { |v| v.match?(/\d/) }
senha.adicionar_validacao("Deve conter letra") { |v| v.match?(/[a-zA-Z]/) }
senha.exibir_resultado

# ========================================
# 14. EXEMPLO PRÁTICO: PIPELINE DE DADOS
# ========================================
puts "\n14. EXEMPLO PRÁTICO: PIPELINE DE DADOS"
puts "-" * 70

class Pipeline
  def initialize(dados)
    @dados = dados
  end
  
  def aplicar(&transformacao)
    @dados = transformacao.call(@dados)
    self
  end
  
  def resultado
    @dados
  end
end

# Processar lista de produtos
produtos = [
  { nome: "Notebook", preco: 3000, estoque: 5 },
  { nome: "Mouse", preco: 50, estoque: 0 },
  { nome: "Teclado", preco: 150, estoque: 10 },
  { nome: "Monitor", preco: 800, estoque: 3 },
  { nome: "Webcam", preco: 200, estoque: 0 }
]

puts "Pipeline de processamento de produtos:"

resultado = Pipeline.new(produtos)
  .aplicar { |p| p.select { |prod| prod[:estoque] > 0 } }  # Apenas em estoque
  .aplicar { |p| p.map { |prod| prod.merge(desconto: prod[:preco] * 0.1) } }  # Adicionar desconto
  .aplicar { |p| p.sort_by { |prod| prod[:preco] }.reverse }  # Ordenar por preço
  .resultado

puts "\nProdutos em estoque com desconto (ordenados por preço):"
resultado.each do |prod|
  puts "  #{prod[:nome]}: R$ #{prod[:preco]} (desconto: R$ #{prod[:desconto].round(2)})"
end

# ========================================
# 15. QUANDO USAR PROC vs LAMBDA
# ========================================
puts "\n15. QUANDO USAR PROC vs LAMBDA"
puts "-" * 70

puts "📌 USE LAMBDA quando:"
puts "  • Precisar de comportamento semelhante a métodos"
puts "  • Quiser validação rigorosa de argumentos"
puts "  • Return deve sair apenas do lambda, não do método"
puts "  • Trabalhar com programação funcional"
puts "  • Compor funções e criar pipelines"

puts "\n📌 USE PROC quando:"
puts "  • Trabalhar com blocos convertidos (&bloco)"
puts "  • Precisar de flexibilidade com argumentos"
puts "  • Trabalhar com callbacks simples"
puts "  • Não se importar com validação estrita"

puts "\n📌 SINTAXES:"
puts "  Lambda: lambda { } ou ->() { }"
puts "  Proc: Proc.new { }"
puts "  Bloco para Proc: def metodo(&bloco)"

# ========================================
# 16. MÉTODOS ÚTEIS
# ========================================
puts "\n16. MÉTODOS ÚTEIS"
puts "-" * 70

meu_lambda = ->(x, y) { x + y }
meu_proc = Proc.new { |x, y| x + y }

puts "Lambda:"
puts "  .lambda? => #{meu_lambda.lambda?}"
puts "  .arity => #{meu_lambda.arity} (número de parâmetros)"
puts "  .parameters => #{meu_lambda.parameters.inspect}"

puts "\nProc:"
puts "  .lambda? => #{meu_proc.lambda?}"
puts "  .arity => #{meu_proc.arity}"
puts "  .parameters => #{meu_proc.parameters.inspect}"

# Verificar source location (onde foi definido)
puts "\nSource location do lambda: #{meu_lambda.source_location.inspect}"

puts "\n" + "=" * 70
puts "FIM DOS EXEMPLOS DE PROCS E LAMBDAS"
puts "=" * 70
