phrase = "The Ruby programming language is amazing!"

puts phrase.include? "Ruby"


def custom_include?(string, substring)

  string.chars.each_with_index do |char, index|
    return true if substring==string[index,substring.length]
  end
  false
end

puts custom_include?(phrase, "zing!")
