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
