numbers =[1,2,3,2,7,7,8,9,1]

p numbers.uniq


def custom_uniq(array)
  arr_fin=[]
  array.each do |n|
    arr_fin.include?(n) ? next : arr_fin<< n
  end
  arr_fin
end

p custom_uniq(numbers)
