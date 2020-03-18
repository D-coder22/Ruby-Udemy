loco= %w[house airport bar]
p loco
loco.push("restaurant", "Saloon")
p loco

loco1= %w[house airport bar]

loco1 << "restaurant" << "Saloon"
p loco1

loco2= %w[house airport apartment]

loco2.insert(1, "restaurant", "cafe") #.insert(index_pos,value)
p loco2
