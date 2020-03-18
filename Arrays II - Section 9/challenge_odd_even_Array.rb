fives =[5,10,15,20,25,30,35,40]
odd=0
even=0

fives.each do |num|
  if num.even?
    even+=num
  else
    odd+=num
  end
end

puts "#{even}\n#{odd}"
