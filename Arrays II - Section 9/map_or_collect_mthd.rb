nums = [1,2,3,4,5]

square = nums.map {|n| n**2}
p square


fahr_temp=[105,73,-40,18,40,-2]

celc_temp = fahr_temp.map do |temp|
  min32=temp-32
  min32*(5.0/9.0)
end

p celc_temp


#collect and map do the same thing
