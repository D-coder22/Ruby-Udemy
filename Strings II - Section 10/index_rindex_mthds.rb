fact = "I am very handsome."

p fact.index("e")
p fact.rindex("e")

def custom_index(string, substring)
  return nil unless string.include?(substring)

  leng=substring.length
  string.chars.each_with_index do |chr, i|
    seqnc=string[i,leng]
    return i if seqnc==substring
  end
end

p custom_index(fact, "am")
