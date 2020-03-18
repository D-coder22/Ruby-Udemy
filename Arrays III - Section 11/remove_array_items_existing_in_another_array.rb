p [1,1,2,2,3,3,3,4,5] - [2,3]

a = [1,1,2,2,3,3,3,4,5]
b = [2,3]

def custom_subt(arr1,arr2)
  fin=[]
  arr1.each do |n|
    fin << n unless arr2.include?(n)
  end
  fin
end

p custom_subt(a,b)
