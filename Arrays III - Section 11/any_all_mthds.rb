p [1,3,5,7,2].any? do |number|
  number.even?
end

p [1,2,3,5,7,9].all? { |m| m.odd?}
# do not used do-end for all? 
