nums= [1,2,3,4,5]
sum=0
nums.each_with_index do |num,i|
  sum+=(num*i)
  puts sum if i==nums.length-1
end
