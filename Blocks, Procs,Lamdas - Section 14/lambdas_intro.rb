sq_proc= Proc.new {|num| num**2 }
sq_lamda= lambda{|num| num**2 }

p [1,2,3].map(&sq_proc)
puts
p [1,2,3].map(&sq_lamda)
p sq_lamda.call(5)

some_prc=Proc.new{ |name,age| "Your name is #{name} and your age is #{age}"}

p some_prc.call("Boris",25)
p some_prc.call("Boris")

some_lmd=lambda{ |name,age| "Your name is #{name} and your age is #{age}"}

p some_lmd.call("Boris",40)
