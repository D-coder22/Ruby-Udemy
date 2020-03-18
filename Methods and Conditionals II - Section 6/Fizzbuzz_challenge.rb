def fizzbuzz (number)
  i=1
  while i<=number #until i>number
    if i%3==0
      if i%5==0
        p "Fizzbuzz #{i}"
      else
        p "Fizz #{i}"
      end
    elsif i%5==0
      p "Buzz #{i}"
    end
    i+=1
  end
end

fizzbuzz(25)
