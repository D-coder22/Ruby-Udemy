puts "Hellow world".delete("lo") #every character goes

def custom_delete(string, srch_chars = "")
  final=""
  string.each_char do |letr|
    final << letr unless srch_chars.include?(letr)
  end
  final
end

p custom_delete("Hellow world", "lo")
