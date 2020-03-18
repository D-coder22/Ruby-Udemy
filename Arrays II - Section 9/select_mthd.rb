grades = [80,95,13,76,28,39]

arr = grades.select do |grd|
  grd>=75
end

p arr
