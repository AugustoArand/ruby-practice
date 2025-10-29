dial_book ={
  "Alice Springs" => "08",
  "Brisbane" => "07",
  "Canberra" => "02",
  "Darwin" => "08",
  "Hobart" => "03",
  "Melbourne" => "03",
  "Perth" => "08",
  "Sydney" => "02"
}

def get_city_names(dial_book)
  dial_book.keys
end

def get_area_code(dial_book, city)
  dial_book[city]
end

puts "Do you want to look up an area code based on a city name? (Y/N)"

# Exemplo 01 - Sem Loop
# response = gets.chomp.upcase

# if response == 'Y'
#   puts "Available cities:"
#   puts get_city_names(dial_book)
#   print "Enter a city name: "
#   city = gets.chomp
#   area_code = get_area_code(dial_book, city)
#   if area_code
#     puts "The area code for #{city} is #{area_code}."
#   else
#     puts "City not found."
#   end
# else
#   puts "Goodbye!"
# end
#----------------------------------------------#
# Exemplo 02 - Com Loop

loop do
  input = gets.chomp.downcase
  break if input != 'y' # Quebra o loop se a resposta não for 'Y'

  puts "Available cities:"
  puts get_city_names(dial_book)
  print "Enter a city name: "
  city = gets.chomp
  area_code = get_area_code(dial_book, city)
  if area_code
    puts "The area code for #{city} is #{area_code}."
  else
    puts "City not found."
  end

  puts "Do you want to look up another area code? (Y/N)"
end
