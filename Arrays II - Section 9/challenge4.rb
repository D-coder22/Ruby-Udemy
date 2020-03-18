def print_if(arr)
  arr.each_with_index do |n,i|
    puts n*i if i>n
  end
end


print_if([-1,2,1,2,5,7,3])
