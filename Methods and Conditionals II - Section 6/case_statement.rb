# def rate_my_food(food)
#   case food
#   when "steak"
#     "pass the sauce"
#   when "sushi"
#     "gimme chopsticks"
#   when "Tacos", "Burritos"
#     "Cheesy fillings, i love it"
#   else
#     "Never heard of it"
#   end
# end
#
# puts "Enter food"
# puts rate_my_food(gets.chomp)

puts

def calculate_grades(grade)
  case grade
  when 90..100
    "A"
  #OR
  #when 90..100 then "A"
  when 80..89
    "B"
  when 70..79
    "C"
  when 60..69
    "D"
  else
    "F"
  end
end

p calculate_grades(45)
