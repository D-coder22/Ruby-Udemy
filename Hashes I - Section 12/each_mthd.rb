shopping_list= {bananas: 5,
                oranges: 10,
                carrots: 3,
                crackers: 15}


shopping_list.each do |item, qty|
  puts "Querying hash.."
  puts "bring #{qty} #{item}"
end

shopping_list.each do |wow|
  p wow
end
