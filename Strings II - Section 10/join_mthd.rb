names = %w[Joe Moe Bob]
p names
p names.join("-")
p names
puts
def custom_join(array, delimitter ="")
  str=""
  array.each_with_index do |word, i|
    unless i==array.length-1
      str << word << delimitter
    else
      str << word
    end
  end
  str
end

p custom_join(names)
p custom_join(names, "-")
