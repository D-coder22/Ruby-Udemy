#two ways for blocks
# 1 (single line)
4.times {|count| puts "#{count+1}" }
puts

# 2 (more than one line)

3.times do |count| #way to define block variables
puts "We are at loop number #{count+1}"
puts "Ruby is gooood"
puts ":)"
end


10.times do |count|
puts "#{3*(count+1)}"
end
