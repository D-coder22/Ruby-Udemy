foods = ["steak", "vegetables", "steak burger", "kale",
         "Tofu", "tuna steaks"]

good = foods.select {|food| food.include?("steak")}
bad = foods.reject {|food| food.include?("steak")}
p good
p bad



good1, bad1 =foods.partition {|food| food.include?("steak")}
puts
p good1
p bad1
