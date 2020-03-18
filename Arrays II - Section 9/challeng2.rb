fives = [5,10,15,20,25]

fives.each_with_index do |fiv, i|
  puts "Product of #{i} and #{fiv} is #{fiv *i}"
end
