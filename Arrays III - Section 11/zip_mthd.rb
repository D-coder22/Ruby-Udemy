names = %w[Bo Moe Joe]
registrations =[true,false,false]

p names.zip(registrations)

p [1,2,3].zip([4,5,6],['A','B','C'])

def custom_zip(arr1,arr2)
  fin=[]
  in_fin=[]
  arr1.each_with_index do |num,i|
    fin << [num , arr2[i]]
  end
  fin
end


p custom_zip(names, registrations)
