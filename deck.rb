require_relative 'card'

# Represents a deck of playing cards.
class Deck

  attr_accessor :cards

  # Returns an array of all 52 playing cards.
  def self.all_cards
    all_cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        all_cards << Card.new(suit, value)
      end
    end
    all_cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
    self.shuffle
  end

  # Returns the number of cards in the deck.
  def count
    self.cards.length
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    raise "not enough cards" if n > self.count
    self.cards.shift(n)
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    self.cards += cards
  end

  def shuffle
    self.cards.shuffle!
  end

end
