pokemon = {squirtle: "water",
           bulbasaur: "Grass",
           charizard: "Fire"}

p pokemon.sort
puts

p pokemon.sort_by {|poke,type| poke}
puts
p pokemon.sort_by {|poke,type| type}
