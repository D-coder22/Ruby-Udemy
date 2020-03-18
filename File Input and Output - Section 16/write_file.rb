
File.open("myFirstFile.txt", "w") do |file|
  file.puts "blah"
end

File.open("myFirstFile.txt", "a") do |file|
  file.puts "appending"
end
