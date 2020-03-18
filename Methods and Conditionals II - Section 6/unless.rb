password ="whiskers"

if password !="whiskers"
  puts "not allowed!"
else
  puts "Welcome"
end
#or

unless password == "whiskers"
  puts "not allowed!"
else
  puts "Welcome"
end


unless password.include?("a")
  puts "It doesnt include 'a'"
end
