p 1.class
p 3.14.class
p true.class
p false.class
p nil.class
p [1,2,3].class
puts "\n"

puts 1.is_a?(Array)

arr =["a","b"]

if arr.is_a?(Array)
  arr.each{|f| puts f}
end
