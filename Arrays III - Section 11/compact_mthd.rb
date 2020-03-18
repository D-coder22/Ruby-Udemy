p [1,2,3,4].compact
p [1,2,3,nil,nil,4,nil].compact

def custom_compact(array)
  fin=[]
  array.each do |elem|
    elem==nil ? next : fin << elem
  end
  fin
end

p custom_compact([1,2,3,nil,nil,4,nil])
