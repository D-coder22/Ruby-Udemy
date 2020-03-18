recipe = {sugar: 5,flour: 10, salt: 2, pepper: 4}

high = recipe.select { |ingred,teaspns| teaspns>=5 }

p high


low = recipe.reject { |ingred,teaspns| teaspns>=5 }

p low
