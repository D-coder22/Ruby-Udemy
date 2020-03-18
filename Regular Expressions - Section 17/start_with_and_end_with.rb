phrase = "The Ruby programming language is amazing!"

puts phrase.start_with?("The")

def custom_start_with?(string, substring)
  substring==string[0,substring.length]
end

def custom_end_with?(string, substring)
  substring==string[-substring.length..-1]
end

p custom_start_with?(phrase, "The")
p custom_end_with?(phrase,"zing!")
