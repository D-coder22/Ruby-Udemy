p 4*4
p "Ruby"*3

p [1,2,4]*2

def custom_multiply(array, number=1)
  fin=[]
  number.times do
    array.each do |elem|
      fin<< elem
    end
  end
  fin
end

p custom_multiply([1,2,4],3)
