module Purchaseable
  def purchase(item)
    "#{item} has been purchased!"
  end
end

class Bookstore
  include Purchaseable

  def purchase(item)
    "You bought a copy of #{item} at the Bookstore"
  end
end

class Supermarket
  include Purchaseable
end

class CornetMart < Supermarket
end
barnes_and_noble = Bookstore.new
p barnes_and_noble.purchase("Atlas Shrugged")

shoprite = Supermarket.new
p shoprite.purchase("Ice cream")

quickstop = CornetMart.new
p quickstop.purchase("Slim Jim")

p Bookstore.ancestors
