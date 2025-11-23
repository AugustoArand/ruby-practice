puts "=" * 60
puts "TRATAMENTO DE EXCEÇÕES EM RUBY"
puts "=" * 60

# ========================================
# 1. BEGIN-RESCUE BÁSICO
# ========================================
puts "\n1. BEGIN-RESCUE BÁSICO"
puts "-" * 40

# Estrutura básica de tratamento de exceção
begin
  puts "Tentando dividir 10 por 0..."
  resultado = 10 / 0
  puts "Resultado: #{resultado}"
rescue
  puts "❌ ERRO: Algo deu errado!"
end

puts "Programa continua executando..."

# ========================================
# 2. RESCUE COM TIPO DE EXCEÇÃO
# ========================================
puts "\n2. RESCUE COM TIPO DE EXCEÇÃO"
puts "-" * 40

begin
  puts "Tentando dividir 10 por 0..."
  resultado = 10 / 0
rescue ZeroDivisionError
  puts "❌ ERRO: Não é possível dividir por zero!"
end

# Múltiplas exceções específicas
begin
  puts "\nTentando acessar índice inexistente..."
  array = [1, 2, 3]
  puts array.fetch(10)  # Lança IndexError
rescue ZeroDivisionError
  puts "❌ ERRO: Divisão por zero"
rescue IndexError
  puts "❌ ERRO: Índice fora dos limites"
rescue StandardError => e
  puts "❌ ERRO genérico: #{e.message}"
end

# ========================================
# 3. CAPTURANDO DETALHES DA EXCEÇÃO
# ========================================
puts "\n3. CAPTURANDO DETALHES DA EXCEÇÃO"
puts "-" * 40

begin
  numero = "abc".to_i
  resultado = 100 / numero
rescue ZeroDivisionError => e
  puts "Tipo de erro: #{e.class}"
  puts "Mensagem: #{e.message}"
  puts "Backtrace (primeiras 3 linhas):"
  puts e.backtrace.first(3)
end

# ========================================
# 4. RESCUE INLINE (UMA LINHA)
# ========================================
puts "\n4. RESCUE INLINE (UMA LINHA)"
puts "-" * 40

# Forma compacta para operações simples
resultado = 10 / 0 rescue "Erro ao dividir"
puts "Resultado: #{resultado}"

arquivo = File.read("arquivo_inexistente.txt") rescue "Arquivo não encontrado"
puts "Conteúdo: #{arquivo}"

valor = Integer("abc") rescue 0
puts "Valor convertido: #{valor}"

# ========================================
# 5. ELSE - EXECUTA SE NÃO HOUVER EXCEÇÃO
# ========================================
puts "\n5. ELSE - EXECUTA SE NÃO HOUVER EXCEÇÃO"
puts "-" * 40

def dividir(a, b)
  begin
    resultado = a / b
  rescue ZeroDivisionError
    puts "❌ Erro: divisão por zero"
  else
    puts "✅ Divisão bem-sucedida: #{a} / #{b} = #{resultado}"
  end
end

dividir(10, 2)
dividir(10, 0)

# ========================================
# 6. ENSURE - SEMPRE EXECUTA
# ========================================
puts "\n6. ENSURE - SEMPRE EXECUTA"
puts "-" * 40

def abrir_arquivo(nome)
  begin
    puts "Abrindo arquivo #{nome}..."
    arquivo = File.open(nome, 'r')
    conteudo = arquivo.read
    puts "Arquivo lido com sucesso!"
    return conteudo
  rescue Errno::ENOENT
    puts "❌ Erro: Arquivo não encontrado"
  rescue StandardError => e
    puts "❌ Erro ao ler arquivo: #{e.message}"
  else
    puts "✅ Nenhum erro ocorreu"
  ensure
    puts "🔒 Bloco ENSURE: Limpando recursos..."
    arquivo.close if arquivo && !arquivo.closed?
    puts "Finalizando operação"
  end
end

abrir_arquivo("arquivo_inexistente.txt")

# ========================================
# 7. RETRY - TENTAR NOVAMENTE
# ========================================
puts "\n7. RETRY - TENTAR NOVAMENTE"
puts "-" * 40

tentativas = 0

begin
  tentativas += 1
  puts "Tentativa ##{tentativas}"
  
  # Simulando uma operação que pode falhar
  if tentativas < 3
    raise "Erro simulado - tentativa #{tentativas}"
  end
  
  puts "✅ Operação bem-sucedida!"
rescue StandardError => e
  puts "❌ #{e.message}"
  
  if tentativas < 3
    puts "Tentando novamente...\n"
    retry
  else
    puts "Número máximo de tentativas atingido"
  end
end

# ========================================
# 8. RAISE - LANÇANDO EXCEÇÕES
# ========================================
puts "\n8. RAISE - LANÇANDO EXCEÇÕES"
puts "-" * 40

def validar_idade(idade)
  raise ArgumentError, "Idade não pode ser negativa" if idade < 0
  raise ArgumentError, "Idade não pode ser maior que 150" if idade > 150
  
  puts "✅ Idade válida: #{idade} anos"
end

begin
  validar_idade(25)
  validar_idade(-5)
rescue ArgumentError => e
  puts "❌ Erro de validação: #{e.message}"
end

# ========================================
# 9. EXCEÇÕES CUSTOMIZADAS
# ========================================
puts "\n9. EXCEÇÕES CUSTOMIZADAS"
puts "-" * 40

# Definindo exceções personalizadas
class SaldoInsuficienteError < StandardError
  def initialize(saldo, valor_saque)
    super("Saldo insuficiente! Saldo: R$ #{saldo}, Tentativa de saque: R$ #{valor_saque}")
  end
end

class ContaBloqueadaError < StandardError; end

class ContaBancaria
  attr_reader :saldo, :bloqueada
  
  def initialize(saldo_inicial)
    @saldo = saldo_inicial
    @bloqueada = false
  end
  
  def bloquear
    @bloqueada = true
  end
  
  def sacar(valor)
    raise ContaBloqueadaError, "Conta está bloqueada" if @bloqueada
    raise ArgumentError, "Valor deve ser positivo" if valor <= 0
    raise SaldoInsuficienteError.new(@saldo, valor) if valor > @saldo
    
    @saldo -= valor
    puts "✅ Saque de R$ #{valor} realizado. Saldo atual: R$ #{@saldo}"
  end
end

conta = ContaBancaria.new(100)

begin
  conta.sacar(50)
  conta.sacar(80)
rescue SaldoInsuficienteError => e
  puts "❌ #{e.message}"
rescue ContaBloqueadaError => e
  puts "❌ #{e.message}"
rescue ArgumentError => e
  puts "❌ Argumento inválido: #{e.message}"
end

# ========================================
# 10. MÚLTIPLOS RESCUES
# ========================================
puts "\n10. MÚLTIPLOS RESCUES"
puts "-" * 40

def processar_dados(dados)
  begin
    # Várias operações que podem falhar
    numero = Integer(dados[:numero])
    resultado = 100 / numero
    arquivo = File.read(dados[:arquivo])
    
    puts "✅ Processamento concluído: #{resultado}"
  rescue TypeError
    puts "❌ Erro de tipo: dados incorretos"
  rescue ArgumentError
    puts "❌ Erro de argumento: conversão falhou"
  rescue ZeroDivisionError
    puts "❌ Erro matemático: divisão por zero"
  rescue Errno::ENOENT
    puts "❌ Erro de arquivo: arquivo não encontrado"
  rescue StandardError => e
    puts "❌ Erro geral: #{e.class} - #{e.message}"
  end
end

processar_dados({ numero: "0", arquivo: "teste.txt" })
processar_dados({ numero: "abc", arquivo: "teste.txt" })

# ========================================
# 11. RESCUE EM MÉTODOS (SEM BEGIN)
# ========================================
puts "\n11. RESCUE EM MÉTODOS (SEM BEGIN)"
puts "-" * 40

def calcular_media(numeros)
  soma = numeros.sum
  media = soma / numeros.size
  puts "✅ Média: #{media}"
  media
rescue ZeroDivisionError
  puts "❌ Lista vazia, não é possível calcular média"
  0
rescue NoMethodError
  puts "❌ Entrada inválida: esperado um array"
  nil
end

calcular_media([10, 20, 30])
calcular_media([])
calcular_media(nil)

# ========================================
# 12. THROW E CATCH (CONTROLE DE FLUXO)
# ========================================
puts "\n12. THROW E CATCH (CONTROLE DE FLUXO)"
puts "-" * 40

# throw/catch não são exceções, mas controle de fluxo
def processar_lista(lista)
  resultado = catch(:item_invalido) do
    lista.each_with_index do |item, index|
      if item.nil?
        throw :item_invalido, "Item #{index} é nil"
      elsif item < 0
        throw :item_invalido, "Item #{index} é negativo: #{item}"
      end
      puts "Processando item #{index}: #{item}"
    end
    "✅ Todos os itens processados com sucesso"
  end
  
  puts resultado
end

processar_lista([1, 2, 3, 4])
puts ""
processar_lista([1, 2, -5, 4])

# ========================================
# 13. HIERARQUIA DE EXCEÇÕES
# ========================================
puts "\n13. HIERARQUIA DE EXCEÇÕES"
puts "-" * 40

puts "Hierarquia comum de exceções em Ruby:"
puts "Exception (não capturar!)"
puts "  ├─ NoMemoryError"
puts "  ├─ ScriptError"
puts "  │   ├─ LoadError"
puts "  │   └─ SyntaxError"
puts "  ├─ SignalException"
puts "  │   └─ Interrupt"
puts "  └─ StandardError (capturar este!)"
puts "      ├─ ArgumentError"
puts "      ├─ IOError"
puts "      │   └─ EOFError"
puts "      ├─ IndexError"
puts "      ├─ RuntimeError"
puts "      ├─ TypeError"
puts "      └─ ZeroDivisionError"

# ========================================
# 14. EXEMPLO PRÁTICO: VALIDADOR DE USUÁRIO
# ========================================
puts "\n14. EXEMPLO PRÁTICO: VALIDADOR DE USUÁRIO"
puts "-" * 40

class EmailInvalidoError < StandardError; end
class SenhaFracaError < StandardError; end
class UsuarioExistenteError < StandardError; end

class ValidadorUsuario
  USUARIOS_EXISTENTES = ["joao@email.com", "maria@email.com"]
  
  def self.validar(email, senha)
    validar_email(email)
    validar_senha(senha)
    verificar_duplicata(email)
    
    puts "✅ Usuário válido: #{email}"
    true
  rescue EmailInvalidoError, SenhaFracaError, UsuarioExistenteError => e
    puts "❌ Validação falhou: #{e.message}"
    false
  end
  
  private
  
  def self.validar_email(email)
    raise EmailInvalidoError, "Email não pode ser vazio" if email.nil? || email.empty?
    raise EmailInvalidoError, "Email inválido: falta @" unless email.include?("@")
    raise EmailInvalidoError, "Email inválido: falta domínio" unless email.include?(".")
  end
  
  def self.validar_senha(senha)
    raise SenhaFracaError, "Senha não pode ser vazia" if senha.nil? || senha.empty?
    raise SenhaFracaError, "Senha muito curta (mínimo 6 caracteres)" if senha.length < 6
    raise SenhaFracaError, "Senha deve conter números" unless senha.match?(/\d/)
  end
  
  def self.verificar_duplicata(email)
    if USUARIOS_EXISTENTES.include?(email)
      raise UsuarioExistenteError, "Email já cadastrado"
    end
  end
end

ValidadorUsuario.validar("novo@email.com", "senha123")
ValidadorUsuario.validar("joao@email.com", "senha123")
ValidadorUsuario.validar("invalido", "senha123")
ValidadorUsuario.validar("teste@email.com", "123")

# ========================================
# 15. BOAS PRÁTICAS
# ========================================
puts "\n15. BOAS PRÁTICAS"
puts "-" * 40

puts "✅ FAÇA:"
puts "  • Capture exceções específicas (ZeroDivisionError, ArgumentError, etc.)"
puts "  • Use StandardError como fallback"
puts "  • Sempre use 'ensure' para liberar recursos (arquivos, conexões)"
puts "  • Crie exceções customizadas para erros de domínio"
puts "  • Forneça mensagens de erro claras e úteis"
puts "  • Use 'rescue' inline para operações simples"

puts "\n❌ NÃO FAÇA:"
puts "  • Não capture 'Exception' (muito genérico)"
puts "  • Não use rescue vazio sem tratar o erro"
puts "  • Não ignore exceções silenciosamente"
puts "  • Não use exceções para controle de fluxo normal"
puts "  • Não capture exceções que você não pode tratar"

# ========================================
# 16. EXEMPLO COMPLETO: SISTEMA DE ARQUIVOS
# ========================================
puts "\n16. EXEMPLO COMPLETO: SISTEMA DE ARQUIVOS"
puts "-" * 40

class GerenciadorArquivos
  def self.ler_arquivo_seguro(nome_arquivo)
    tentativas = 0
    max_tentativas = 3
    
    begin
      tentativas += 1
      puts "Tentativa #{tentativas}: Abrindo #{nome_arquivo}..."
      
      # Simular falha nas primeiras tentativas
      if tentativas < 2
        raise IOError, "Erro de I/O temporário"
      end
      
      arquivo = File.open(nome_arquivo, 'r')
      conteudo = arquivo.read
      
      puts "✅ Arquivo lido com sucesso!"
      conteudo
      
    rescue Errno::ENOENT
      puts "❌ Erro: Arquivo '#{nome_arquivo}' não encontrado"
      nil
      
    rescue Errno::EACCES
      puts "❌ Erro: Sem permissão para ler '#{nome_arquivo}'"
      nil
      
    rescue IOError => e
      puts "❌ Erro de I/O: #{e.message}"
      
      if tentativas < max_tentativas
        puts "Aguardando antes de tentar novamente..."
        sleep(0.5)
        retry
      else
        puts "Número máximo de tentativas atingido"
        nil
      end
      
    rescue StandardError => e
      puts "❌ Erro inesperado: #{e.class} - #{e.message}"
      puts "Backtrace: #{e.backtrace.first(2).join("\n")}"
      nil
      
    else
      puts "✅ Nenhuma exceção foi lançada"
      
    ensure
      if arquivo && !arquivo.closed?
        arquivo.close
        puts "🔒 Arquivo fechado"
      end
      puts "Operação finalizada\n"
    end
  end
end

GerenciadorArquivos.ler_arquivo_seguro("arquivo_teste.txt")

puts "\n" + "=" * 60
puts "FIM DOS EXEMPLOS DE EXCEÇÕES"
puts "=" * 60
