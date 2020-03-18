stock_prices = [723.66, 434.12, 87.34, 649.92]

p stock_prices.max
p stock_prices.max(3)
p stock_prices.min
p stock_prices.min(2)
p stock_prices.max(stock_prices.length)



def custom_max(arr)
  mx=arr[0]
  arr.each{|n| mx=n if n>mx}  #or arr.sort[-1]
  mx
end



def custom_min(arr)
  mn=arr[0]
  arr.each{|n| mn=n if n<mn}  #or arr.sort[0]
  mn
end


p custom_max(stock_prices)
p custom_min(stock_prices)
