class Employee

  attr_accessor :age
  attr_reader :name

  def initialize(name,age)
    @name = name
    @age = age
  end

  def introduce
    "Hi, my name is #{name} and I am #{age} years old"
  end
end


class Manager < Employee

  def initialize(name, age,rank)
    super(name,age)
    @rank=rank
  end

  def yell
    "Who's the boss? I'm the boss!"
  end

  def introduce
    result = super
    result += " and I'm the Manager"
  end
end

sally = Manager.new("Sally", 42, "Senior Vice President")
p sally.introduce
