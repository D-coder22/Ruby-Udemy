salaries = {director: 10000,
            producer: 20000,
            ceo: 3000000}

salaries.each_key do |posi|
  puts "Employee Record:---"
  puts posi
end

salaries.each_value {|salary| puts "the next Employee earns #{salary}"}

def custom_key(hash)
  fin=[]
  hash.each do |key,val|
    fin << key
  end
  fin
end

def custom_val(hash)
  fin=[]
  hash.each do |key,val|
    fin << val
  end
  fin
end

puts

p custom_key(salaries)
puts
p custom_val(salaries)
