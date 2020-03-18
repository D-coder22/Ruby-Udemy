# class Hash
#   def identify_duplicate_values
#     values = []
#     dupes = []
#
#     self.each_value do |value|
#       values.include?(value) ? dupes << value : values << value
#     end
#     dupes.uniq
#   end
# end
#
# scores = {a: 100, b: 100 , c: 50, d:90 , e:13, f:5, g:100 ,h: 13}
# p scores.identify_duplicate_values

class Integer
  def seconds
    self
  end

  def minutes
    self*60
  end

  def hours
    (self*60).minutes
  end

  def days
    (self*24).hours
  end
end

puts Time.now + 45.minutes
