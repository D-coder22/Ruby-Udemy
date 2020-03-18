evens = [2,4,6,8,10]

evens.each {|num| puts num**3}


colors = %w[red purple green blue]

statements = colors.map{|color| "#{color} is a great color"}

puts statements


5.times do |index|
  puts index
  puts "Let's move on to the next loop"
end
