class Gadget

  attr_accessor :username
  attr_reader :production_number, :username1
  attr_writer :password

  def initialize(username,password)
    @username = username
    @password = password
    @production_number = "#{("a".."z").to_a.sample}-#{rand(1..999)}"
  end

  def to_s
    "Gadget #{@production_number} has the username #{@username}. It is made from the #{self.class} class and it has the ID #{self.object_id}"
  end

end

g1 = Gadget.new("Rubyfan102", "programming123")
g2 = Gadget.new("misterprogrammer", "bestpassever")
