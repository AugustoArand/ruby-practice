# ====================================
# EXEMPLOS DE REGEX EM RUBY
# ====================================

puts "=" * 50
puts "1. VALIDAÇÃO DE EMAIL"
puts "=" * 50

email_regex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

emails = [
  "usuario@exemplo.com",
  "teste.email@dominio.com.br",
  "invalido@",
  "sem-arroba.com",
  "valido_123@test.co"
]

emails.each do |email|
  if email.match?(email_regex)
    puts "✓ '#{email}' é válido"
  else
    puts "✗ '#{email}' é inválido"
  end
end

puts "\n" + "=" * 50
puts "2. VALIDAÇÃO DE TELEFONE BRASILEIRO"
puts "=" * 50

# Aceita formatos: (11) 98765-4321, (11) 8765-4321, 11987654321
telefone_regex = /\A(\(?\d{2}\)?\s?)?9?\d{4}-?\d{4}\z/

telefones = [
  "(11) 98765-4321",
  "(21) 3456-7890",
  "11987654321",
  "119 8765-4321",
  "1234",
  "(11) 98765-432"
]

telefones.each do |tel|
  if tel.match?(telefone_regex)
    puts "✓ '#{tel}' é válido"
  else
    puts "✗ '#{tel}' é inválido"
  end
end

puts "\n" + "=" * 50
puts "3. EXTRAÇÃO DE INFORMAÇÕES"
puts "=" * 50

texto = "Meu email é contato@empresa.com e meu telefone é (11) 98765-4321"

# Extrair email
email_encontrado = texto.match(/[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+/i)
puts "Email encontrado: #{email_encontrado[0]}" if email_encontrado

# Extrair telefone
tel_encontrado = texto.match(/\(\d{2}\)\s\d{5}-\d{4}/)
puts "Telefone encontrado: #{tel_encontrado[0]}" if tel_encontrado

puts "\n" + "=" * 50
puts "4. SUBSTITUIÇÃO DE TEXTO"
puts "=" * 50

frase = "O preço é R$ 100,00 e o desconto é R$ 20,00"
puts "Original: #{frase}"

# Substituir primeira ocorrência
frase_sub = frase.sub(/R\$ \d+,\d{2}/, "R$ 50,00")
puts "Usando .sub: #{frase_sub}"

# Substituir todas as ocorrências
frase_gsub = frase.gsub(/R\$ \d+,\d{2}/, "R$ XX,XX")
puts "Usando .gsub: #{frase_gsub}"

puts "\n" + "=" * 50
puts "5. VALIDAÇÃO DE CPF (formato)"
puts "=" * 50

cpf_regex = /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/

cpfs = [
  "123.456.789-00",
  "111.222.333-44",
  "12345678900",
  "123.456.789-0"
]

cpfs.each do |cpf|
  if cpf.match?(cpf_regex)
    puts "✓ '#{cpf}' tem formato válido"
  else
    puts "✗ '#{cpf}' tem formato inválido"
  end
end

puts "\n" + "=" * 50
puts "6. VALIDAÇÃO DE URL"
puts "=" * 50

url_regex = /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/i

urls = [
  "https://www.exemplo.com",
  "http://site.com.br/pagina",
  "www.google.com",
  "exemplo.com",
  "não é uma url"
]

urls.each do |url|
  if url.match?(url_regex)
    puts "✓ '#{url}' é válida"
  else
    puts "✗ '#{url}' é inválida"
  end
end

puts "\n" + "=" * 50
puts "7. CAPTURA DE GRUPOS"
puts "=" * 50

data_texto = "Hoje é 20/11/2025"
match = data_texto.match(/(\d{2})\/(\d{2})\/(\d{4})/)

if match
  puts "Data completa: #{match[0]}"
  puts "Dia: #{match[1]}"
  puts "Mês: #{match[2]}"
  puts "Ano: #{match[3]}"
end

puts "\n" + "=" * 50
puts "8. VALIDAÇÃO DE SENHA FORTE"
puts "=" * 50

# Senha deve ter: mínimo 8 caracteres, 1 maiúscula, 1 minúscula, 1 número, 1 caractere especial
senha_forte_regex = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/

senhas = [
  "Senha123!",
  "senha123",
  "SENHA123!",
  "Senha!",
  "S3nh@Forte"
]

senhas.each do |senha|
  if senha.match?(senha_forte_regex)
    puts "✓ '#{senha}' é forte"
  else
    puts "✗ '#{senha}' é fraca"
  end
end

puts "\n" + "=" * 50
puts "9. REMOÇÃO DE ESPAÇOS EXTRAS"
puts "=" * 50

texto_espacos = "   Texto   com    muitos    espaços   "
puts "Original: '#{texto_espacos}'"
puts "Limpo: '#{texto_espacos.gsub(/\s+/, ' ').strip}'"

puts "\n" + "=" * 50
puts "10. VALIDAÇÃO DE CÓDIGO POSTAL (CEP)"
puts "=" * 50

cep_regex = /\A\d{5}-?\d{3}\z/

ceps = [
  "12345-678",
  "12345678",
  "1234-567",
  "12345-67"
]

ceps.each do |cep|
  if cep.match?(cep_regex)
    puts "✓ '#{cep}' é válido"
  else
    puts "✗ '#{cep}' é inválido"
  end
end

puts "\n" + "=" * 50
puts "11. EXTRAÇÃO DE HASHTAGS"
puts "=" * 50

tweet = "Aprendendo #Ruby e #Regex hoje! #Programação #DevLife"
hashtags = tweet.scan(/#\w+/)
puts "Tweet: #{tweet}"
puts "Hashtags encontradas: #{hashtags.join(', ')}"

puts "\n" + "=" * 50
puts "12. VALIDAÇÃO DE PLACA DE VEÍCULO (Brasil)"
puts "=" * 50

# Formato antigo: ABC-1234 | Formato Mercosul: ABC1D23
placa_regex = /\A[A-Z]{3}-?\d{1}[A-Z0-9]{1}\d{2}\z/

placas = [
  "ABC-1234",
  "ABC1D23",
  "XYZ-9876",
  "DEF1A99",
  "AB-1234"
]

placas.each do |placa|
  if placa.match?(placa_regex)
    puts "✓ '#{placa}' é válida"
  else
    puts "✗ '#{placa}' é inválida"
  end
end

puts "\n" + "=" * 50
puts "EXEMPLOS CONCLUÍDOS!"
puts "=" * 50
