sales= "I bought 9 apples, 25 bananas, and 4 oranges at the store."

puts sales.scan(/[^aeiouAEIOU\s,\.\d]/)
