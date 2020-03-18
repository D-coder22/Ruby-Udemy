nums = [1,2,3,"Hello",5,6,nil,7,8,[]]

nums.each do |n|
  unless n.is_a?(Integer)
    next
  else
    puts "number #{n}"
  end
end
