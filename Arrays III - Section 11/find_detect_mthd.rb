words = %w[dictionary refrigerator platypus microwave]

p words.select {|word| word.length>8}

p words.find { |w| w.length>8  }
p words.detect { |w| w.length>8  }

lottery = [4,8,15,16,23,42]


result = lottery.find do |num|
  num.odd?
end

p result
