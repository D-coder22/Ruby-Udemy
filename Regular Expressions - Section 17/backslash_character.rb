paragraph = "this is my essay. I deserve an A. I rank it a 5 out of 5."

puts paragraph.scan(/\./)
p paragraph.scan(/\d/)
p paragraph.scan(/\D/) #no digits
p paragraph.scan(/\s/)
