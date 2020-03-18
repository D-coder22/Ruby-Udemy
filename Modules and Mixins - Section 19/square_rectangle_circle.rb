module Square
  def self.area(side)
    side*side
  end
end

module Rectangle
  def  self.area(len,wid)
    len*wid
  end
end

module Circle
  PI = 3.14159

  def self.area(radi)
    PI*radi*radi
  end
end

puts Square.area(4)
puts Rectangle.area(4,10)
puts Circle.area(10)
