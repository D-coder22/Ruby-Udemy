names = ["tom", "cameron", "bob"]

p names[2]
p names[100]

p names.fetch(2)
p names.fetch(100, nil) # if nil removed..error occurs
                        #nil can be replaced by anything
