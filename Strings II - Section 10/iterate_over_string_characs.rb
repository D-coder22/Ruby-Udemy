"hello world".each_char do |letter|
  puts letter
end

puts
name = "Amit"
p name.split("")
letters = name.chars
letters.each { |letter| puts "#{letter} is Awesome!"  }
