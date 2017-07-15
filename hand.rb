require_relative 'deck'

class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    Hand.new(deck.take(8))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def draw(deck)
    self.cards += deck.take(1)
  end

  def remove_card(card)
    self.cards.delete(card)
  end

  def count
    self.cards.length
  end

end


# d1 = Deck.new
# h1 = Hand.deal_from(d1)
# h2 = Hand.deal_from(d1)
#
# p h1.cards.map{|card| card.to_s}
# p h2.cards.map{|card| card.to_s}
