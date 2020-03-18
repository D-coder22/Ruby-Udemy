sentence= "Thhe aardvark jummped    ovver the fence"

puts sentence.squeeze

sentence1= "Thhe aardvark jummped    ovver the fence"

puts sentence1.squeeze(" ")

def custom_squeeze(string)
  final=""
  chars=string.split("")
  chars.each_with_index do |char, i|
    char== chars[i+1] ? next : final << char
  end
  return final
end

p custom_squeeze(sentence)
