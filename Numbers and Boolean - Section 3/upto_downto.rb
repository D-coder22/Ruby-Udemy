5.downto(1) { |i| puts "countdown: #{i}" }

puts

5.downto(0) do |j|
puts
puts" On #{j}"
end

puts
5.upto(10) do |ctr|
  puts "upwards"
  puts "#{ctr}"
end
