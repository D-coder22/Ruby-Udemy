def pass_control
  puts "This is inside the method"
  yield #pass control form method to block
  puts "back here again"
end

pass_control { puts "Now i'm inside block"}
puts

pass_control do
  puts "nice  1"
  puts "nice  2"
end
