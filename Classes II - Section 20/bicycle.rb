class Bicycle
  @@maker = "BikeTech"
  @@count = 0

  def self.description
    "Hi there, I'm the blueprint for Bicycles! Use me to create a bicycle object."
  end

  def self.count
    @@count
  end
end

puts Bicycle.description
puts Bicycle.count
