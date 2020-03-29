class Card
  SUITS = %i(diamonds clubs hearts spades)
  POINTS = 1..13

  attr_reader :point, :suit
  def initialize(point:, suit:)
    unless POINTS.to_a.include?(point)
      raise RuntimeError.new("points should be between #{POINTS}")
    end
    unless SUITS.include?(suit)
      raise ArgumentError.new("suit should be one of#{SUITS}")
    end
    @point = point
    @suit  = suit
  end

  def converter
    case self.point
    when 1
      @point = "Ace"
    when 13
      @point = "King"
    when 12
      @point = "Queen"
    when 11
      @point = "Jack"
    else
      @point = point
    end
  end
  def face_converter
    self.converter
    return "#{@point.to_s}"
  end
end
