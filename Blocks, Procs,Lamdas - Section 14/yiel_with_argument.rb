def speak_the_truth
  yield "Boris" if block_given?
end

speak_the_truth { |name| puts "#{name} is brillant!"}

def num_eval(num1,num2,num3)
  puts "inside method"
  yield(num1,num2,num3)
end

product = num_eval(5,10,15) { |num1,num2,num3| num1*num2*num3 }
p product
