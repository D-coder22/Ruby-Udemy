puts "Hello worlds".count("l")
puts "Hello worlds".count("lo") #counts character .. basically
                                #o = 2 +l=3 therefore 5
                                #case sensitive

def custom_count(string, srch_chars = "")
  count=0
  string.each_char do |letr|
    srch_chars.each_char do |chr|
      count+=1 if chr==letr
    end
  end
  count
end

p custom_count("Hello worlds", "lo")
