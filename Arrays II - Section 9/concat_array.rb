nums = [1,2,3]

nums.concat([4,5,6])
p nums

def custom_concat(arr1,arr2)
  arr2.each {|elem| arr1.push(elem)}
  arr1
end

a= [1,2,3]
p custom_concat(a,[4,5,6])
p a
