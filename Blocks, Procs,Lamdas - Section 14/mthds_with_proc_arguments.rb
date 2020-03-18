def talk_about(name, &myprc )
  puts "Let me tell you about #{name}"
  myprc.call(name)
end


gd_things= Proc.new do |name|
  puts "#{name} is a genius"
  puts "#{name} is nice"
end

bd_things= Proc.new do |name|
  puts "#{name} is a bad guy"
end

talk_about("Amit", &gd_things)
talk_about("Icarus", &bd_things)
