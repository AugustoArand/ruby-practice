require 'io/console'

login = [
  { usuario: "admin", password: "12345" },
  { usuario: "user", password: "54321" }
]


# Função para autenticar usuário
def authenticate(accounts, user, pass)
  accounts.any? { |acc| acc[:usuario] == user && acc[:password] == pass }
end
#----------------------------------------------------#
# Função para alterar senha
def change_password!(accounts, user)
  account = accounts.find { |a| a[:usuario] == user }
  return unless account
#----------------------------------------------------#
# 04 - Menu da opção de alterar senha (após login)
  print "Digite a nova senha: "
  new_pw = STDIN.noecho(&:gets).chomp
  puts
  print "Confirme a nova senha: "
  confirm = STDIN.noecho(&:gets).chomp
  puts

  if new_pw == confirm && !new_pw.empty?
    account[:password] = new_pw
    puts "Senha atualizada com sucesso."
  else
    puts "As senhas não conferem ou estão vazias. Alteração cancelada."
  end
end

# 01 - Mensagem inicial do Sistema
puts "Bem vindo ao autenticador de sistema"
puts "Caso queira sair do sistema, pressione n"

attempts = 0
max_attempts = 3

# 02 - Menu de inserção de usuário e senha
while attempts < max_attempts
  print "Digite seu usuário: "
  input_user = gets.chomp

  if input_user.downcase == 'n'
    puts "Saindo do sistema. Até logo!"
    break
  end

  print "Digite sua senha: "
  input_password = STDIN.noecho(&:gets).chomp
  puts

  if input_password.downcase == 'n'
    puts "Saindo do sistema. Até logo!"
    break
  end

  if authenticate(login, input_user, input_password)
    puts "Acesso permitido. Bem-vindo, #{input_user}!"
    # 03 - Menu pós-login
    loop do
      puts "\nMenu:"
      puts "1 - Sair"
      puts "2 - Alterar senha"
      print "Escolha uma opção: "
      choice = gets.chomp

      case choice
      when '1'
        puts "Saindo. Até logo!"
        exit
      when '2'
        change_password!(login, input_user)
      else
        puts "Opção inválida."
      end
    end

    break
  else
    attempts += 1
    puts "Usuário ou senha inválidos. Tentativa #{attempts} de #{max_attempts}"
    if attempts >= max_attempts
      puts "Número máximo de tentativas atingido. Acesso bloqueado."
      break
    end
  end
end
