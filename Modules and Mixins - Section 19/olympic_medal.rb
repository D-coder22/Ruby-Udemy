class OlympicMedal

  include Comparable

  MEDAL_VALUES= {"Gold" => 3 , "Silver" => 2, "Bronze" => 1}

  attr_reader :type

  def initialize(type, weight)
    @type = type
    @weight = weight
  end

  def <=>(other)
    if MEDAL_VALUES[type] < MEDAL_VALUES[other.value]
      -1
    elsif MEDAL_VALUES[type] == MEDAL_VALUES[other.value]
      0
    else MEDAL_VALUES[type] > MEDAL_VALUES[other.value]
      1
    end
  end
end

bronze = OlympicMedal.new("Bronze",5)
silver = OlympicMedal.new("Silver",10)
gold = OlympicMedal.new("Gold",3)
