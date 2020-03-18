class ConvenienceStore
  include Enumerable

  attr_reader :snacks

  def initialize
    @snacks = []
  end

  def add_snacks(snack)
    snacks << snack
  end

  def each
    snacks.each do |snack|
      yield snack
    end
  end
end

bodega = ConvenienceStore.new
bodega.add_snacks("Doritos")
bodega.add_snacks("Jolly Ranchers")
bodega.add_snacks("Slim Jims")
p bodega.select{ |snack|  snack.downcase.include?("j")}
