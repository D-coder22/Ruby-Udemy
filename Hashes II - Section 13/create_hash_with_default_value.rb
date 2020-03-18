fruit_prices = {banana: 1.05}

p fruit_prices[:orange]
p fruit_prices[:grape]


fruity= Hash.new(0)

fruity[:banana]=1.05
fruity[:orange]=0.69
fruity[:kiwi]=10.99

p fruity[:banana]
p fruity[:steak]

fruit_prices.default = "Not here"

p fruit_prices[:bleh]
