sentence = "Once upon a time in a land far far away"

def word_count(string)
  new_hash=Hash.new(0)
  temp_arr=string.split
  temp_arr.each do |word|
    new_hash.key?(word) ? new_hash[word]+=1 : new_hash[word]=1
  end
  new_hash
end


p word_count(sentence)
