animals = %w[cheetah cat lion elephant dog cow]

anima = animals.reject {|anim| anim.include?("c")}

p anima
