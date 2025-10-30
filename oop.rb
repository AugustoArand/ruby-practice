class Students 
    attr_accessor :first_name, :last_name, :email, :username,:password

    def initialize(first_name, last_name, email, username, password)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @username = username
        @password = password
    end
end

augusto = Students.new("Augusto", "Silva", "augusto.silva@example.com", "augustosilva", "securepassword")
puts "First name: #{augusto.first_name}"
puts "Last name: #{augusto.last_name}"

