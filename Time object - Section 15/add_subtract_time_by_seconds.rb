start_of_year=Time.new(2019,1,1)
p start_of_year
p start_of_year + 60

def find_day_of_year(number)
  current_date=Time.new(2016,1,1)
  new_date = current_date + (60*60*24*number)
end


p find_day_of_year(150)
