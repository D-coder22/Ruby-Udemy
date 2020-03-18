module Purchaseable
  def purchase(item)
    "#{item} has been purchased!"
  end
end

class Bookstore
  prepend Purchaseable

  def purchase(item)
    "You bought a copy of #{item} at the Bookstore"
  end
end

p Bookstore.ancestors
bn = Bookstore.new
p bn.purchase("1984")
