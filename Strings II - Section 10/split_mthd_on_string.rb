sentence = "Hi, my name is Amit. There are spaces here!"

p sentence.split(" Am") #space is default if u dont give argument
words = sentence.split

words.each {|word| puts word.length}
