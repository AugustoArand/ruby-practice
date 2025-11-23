require_relative 'bcrypt_crud'

login = [
  { usuario: "admin", password: "12345" },
  { usuario: "user", password: "54321" }
]

hashed_users = Crud.create_secure_users(login)
puts hashed_users

