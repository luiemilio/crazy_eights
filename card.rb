require "byebug"

class Card
  SUITS = {
    :spade => "♠",
    :club => "♣",
    :heart => "♥",
    :diamond => "♦"
  }

  RANKS = {
    :ace => "1",
    :two => "2",
    :three => "3",
    :four => "4",
    :five => "5",
    :six => "6",
    :seven => "7",
    :eight => "8",
    :nine => "9",
    :ten => "10",
    :jack => "11",
    :queen => "12",
    :king => "13"
  }

  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def self.suits
    SUITS.keys
  end

  def self.ranks
    RANKS.keys
  end

  def to_s
    # debugger
    "#{SUITS[self.suit]} #{RANKS[self.rank]}"
  end

end
