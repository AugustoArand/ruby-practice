# ...existing code...
login = [
  { usuario: "admin", password: "12345" },
  { usuario: "user", password: "54321" }
]

puts "Bem vindo ao autenticador de sistema"
puts "Caso queira sair do sistema, pressione n"

attempts = 1
while attempts < 4
  print "Digite seu usuário: "
  input_user = gets.chomp

  print "Digite sua senha: "
  input_password = gets.chomp

  if input_user.downcase == 'n' || input_password.downcase == 'n'
    puts "Saindo do sistema. Até logo!"
    break
  end

  authenticated = false # Variavel começa como falso

  # Verifica cada conta no array de login
  login.each do |account|
    if account[:usuario] == input_user && account[:password] == input_password
      authenticated = true
      break
    end
  end

  if authenticated # Comando simplificado para caso seja true
    puts "Acesso permitido"
    puts "Tela especifica para o laço de confirmação de usuário"
    break
  else
    puts "Usuário ou senha inválidos"
    attempts += 1
    puts "Tentativa #{attempts - 1} de 3"
    if attempts == 4
      puts "Número máximo de tentativas atingido. Acesso bloqueado."
      break
    end
  end
end
