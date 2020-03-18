def greeter
  puts "I'm inside the greeter method"
  yield
end

phrase = Proc.new do
  puts "Inside proc"
end
greeter(&phrase)


hi=Proc.new { puts "Hi there"}
puts
5.times(&hi)
#or
puts
hi.call
