p ["1", "2", "3"].map {|num| num.to_i}

p ["1", "2", "3"].map(&:to_i)
p [10,14,25].map(&:to_s)

p [1,2,3,4,5].select { |e| e.even? }
p [1,2,3,4,5].select(&:even?)
