candies= ["sour patch kids", "milky way", "airheads"]

candies.each do |candy|
  puts "I love eating #{candy}"
  puts "It tastes so good"
end


names = %w[bo moe joe]
puts
names.each { |name| puts name.upcase}

puts
[1,2,3,4,5].each do |num|
  square = num * num
  puts "The square of #{num} is #{square}"
end
puts
puts

fives =[5,10,15,20,25,30,35,40]
fives.each do|num|
  puts num if num.even?
end
