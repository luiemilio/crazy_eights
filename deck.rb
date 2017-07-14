require_relative 'card'
require 'byebug'

class Deck
  attr_accessor :cards

  def self.all_cards
    all_cards = []
    Card.suits.each do |suit|
      Card.ranks.each do |rank|
        all_cards << Card.new(suit, rank)
      end
    end
    all_cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def shuffle!
    self.cards = self.cards.shuffle
  end

  def take(n)
    taken = []
    n.times do
      taken << self.cards.shift
    end
    taken
  end
end


deck = Deck.new
