module Announcer
  def who_am_i
    "the name of this class is #{self}"
  end
end

class Dog
  extend Announcer
end

class Cat
  extend Announcer
end

p Dog.who_am_i
