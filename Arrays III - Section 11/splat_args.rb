def sum(*nums)
  sum=0
  nums.each {|num| sum+=num}
  sum
end


p sum(1,2)
p sum(2,4,5,6,4,7,9,6)
