market = {garlic: "3 clows", tomatoes: "5 batches", milk: "10 gallons"}
kitchen={bread: "2 loaves", yogurt: "20 cans", milk: "100 gallons"}


p market.merge(kitchen) # if repeat is present then the argument key + value is
                        #stored
def custom_merge(hash1, hash2)
  fin=hash1.dup
  hash2.each do |ky,val|
    fin[ky]=val
  end
  fin
end


p custom_merge(market,kitchen)
