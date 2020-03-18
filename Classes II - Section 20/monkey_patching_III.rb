class Book
  def initialize(title, author, pages)
    @title = title
    @author = author
    @pages = pages
  end
end


goosebumps = Book.new("Night of the living Dummy", "R.L. Stine", 200)
p goosebumps

class Book
  def read
    1.step(@pages,10) { |page| puts "Reading page #{page}..."}
    puts "Done! #{@title} was a great book!"
  end
end

animal_farm = Book.new("Animal Farm", "George Orwell", 51)
# p animal_farm.read
p goosebumps.read
