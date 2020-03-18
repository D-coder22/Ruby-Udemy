cubes = Proc.new { |num| num ** 3 }




a = [1,2,3,4,5]
b = [6,7,8,9,10]
c = [11,12,13,14,15]

a_cubes, b_cubes, c_cubes= [a,b,c].map {|array| array.map(&cubes)}
puts a_cubes
puts b_cubes
puts c_cubes


currencies = [10,20,30,40,50]

to_euro = Proc.new { |currency| currency*0.95}
to_rupees = Proc.new {|currency| currency*68.13}
puts
p currencies.map(&to_euro)
p currencies.map(&to_rupees)
