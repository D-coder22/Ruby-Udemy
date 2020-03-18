nums = [3,8,11,15,89]

def cubes(array)
  nums_cube= array.collect {|n| n**3}
end

p cubes(nums)
