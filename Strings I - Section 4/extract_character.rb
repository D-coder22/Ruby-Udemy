story = "Once upon a time in a land far, far away..."

p story[5, 4]
#output:
#upon

p story.slice(5,4)
#output:
#upon


p story[-7, 5]
# output:
# away.
puts puts

p story[27..39]
# output:
# far, far away

p story.slice(27..39)
# output:
# far, far away

p story[27...39]
# output:
# far, far awa

p story[32..1000]
# output:
# far away...

puts

p story[25..-9]
# output:
# d far, far
