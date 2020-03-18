p [1,1,2,3,4,5] & [1,1,4,5,8,9]

a= [1,1,2,3,4,5]
b= [1,1,4,5,8,9]

def custom_intersect(arr1,arr2)
  fin=[]
  arr1.uniq.each do |n|
    fin << n if arr2.uniq.include?(n)
  end
  fin
end

p custom_intersect(a,b)
