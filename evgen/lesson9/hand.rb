require_relative "./card"

class Hand
	attr_reader :array
  def initialize
    @array = []
  end

  def add_cards(*card)
  	card.each {|cr| @array << cr}
  end

  def get_points
    @array.sum { |card| card.face_converter.to_i }
  end
end

hands = Hand.new
hand1 = Card.new(point: 1, suit: :hearts)
hand2 = Card.new(point: 2, suit: :hearts)

hands.add_cards(hand1,hand2)

