module LengthConversions

  WEBSITE = "https://www.google.com"

  def self.miles_to_feet(miles) #or LengthConversions.miles_to_feet
    miles*5280
  end

  def self.miles_to_inches(miles)
    feet= miles_to_feet(miles)
    feet*12
  end

  def self.miles_to_centimeters(miles)
    inches=miles_to_inches(miles)
    inches*2.54
  end
end


puts LengthConversions::WEBSITE
puts LengthConversions.miles_to_centimeters(1)
