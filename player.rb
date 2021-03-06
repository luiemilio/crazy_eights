require_relative 'deck'
require_relative 'hand'

class Player
  attr_reader :name
  attr_accessor :hand

  def initialize(name, deck)
    @name = name
    @hand = Hand.deal_from(deck)
  end

  def show_hand
    hand.cards.each.with_index {|card, idx| p "#{idx}: #{card}"}.join
  end

  def hand_count
    self.hand.count
  end



end
