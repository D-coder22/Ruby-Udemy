colors=%w[red blue green yellow]

colors.each_with_index do |color, i|
  puts "moving on to index number #{i}"
  puts "The current color is #{color}"
end
