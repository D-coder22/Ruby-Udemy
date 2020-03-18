
p :name
p :name.class
p :name.methods.length


person = {:name => "Boris",
          :age => 25,
          :handsome => true,
          :language => ["Ruby", "Python", "JavaScript"]}

p person[:name]
p person[:handsome]

person1 = {name: "Boris",
          age: 25,
          handsome: true,
          language: ["Ruby", "Python", "JavaScript"]}

p person1[:name]
