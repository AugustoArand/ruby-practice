
module Crud # Transformando em módulo para ser reutilizado
  require 'bcrypt'
  puts "Module CRUD loaded"

  login = [
    { usuario: "admin", password: "password1" },
    { usuario: "user", password: "password2" }
  ]

  # EXEMPLO CRUD - Utilizando o bcrypt para hashear senhas de usuários
  def Crud.create_hash_digest(password)
    BCrypt::Password.create(password)
  end

  def Crud.verify_hash_digest(password)
    BCrypt::Password.new(password)
  end

  def Crud.create_secure_users(list_users)
    list_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_users
  end

  new_users = create_secure_users(login)
  puts new_users

  def auth_user(username, password, list_users)
    list_users.each do |user_record|
      if user_record[:usuario] == username && verify_hash_digest(user_record[:password]) == password
        return user_record
      end
    end
    "Credentials were not correct"
  end
end

# p auth_user("admin", "password2", new_users)

