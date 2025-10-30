require_relative 'bcrypt'

login = [
  { usuario: "admin", password: "12345" },
  { usuario: "user", password: "54321" }
]

hashed_users = create_secure_users(login)
