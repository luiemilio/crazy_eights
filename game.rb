require_relative 'player'
require_relative 'deck'
require 'byebug'

class Game

  def self.create_players(deck)
    puts "How many players?"
    n = gets.chomp.to_i
    players = []
    n.times do |i|
      puts "Player #{i+1} name?"
      players << Player.new(gets.chomp, deck)
    end
    players
  end

  attr_accessor :deck, :players, :discard_pile, :wild_card_suit

  def initialize(deck = Deck.new)
    system "clear"
    @deck = deck
    @players = Game.create_players(deck)
    @discard_pile = deck.take(1)
    @wild_card_suit = discard_pile.last.suit
  end

  def take_turn(player)
    until self.valid_hand?(player)
      puts "You need to draw a new card"
      player.hand.draw(deck)
    end

    player.show_hand
    current_card = self.get_card(player)
    self.handle_card(player, current_card)
  end

  def current_card_in_pile
    self.discard_pile.last
  end

  def won?(player)
    player.hand.count == 0
  end

  def play
    system "clear"
    until deck.count == 0
      players.each do |player|
        p "CURRENT PLAYER: #{player.name}"
        p "Current discard pile: #{self.current_card_in_pile}"
        self.take_turn(player)
        if won?(player)
          puts "#{player.name} wins!"
          break
        end
        system "clear"
      end
    end

  end

  def get_card(player)
    puts "Select card to play by it's number"
    answer = gets.chomp.to_i
    player.hand.cards[answer]
  end

  def valid_hand?(player)
    suits_in_hand = player.hand.cards.map {|card| card.suit}
    values_in_hand = player.hand.cards.map {|card| card.value}
    # debugger
    suits_in_hand.include?(current_card_in_pile.suit) ||
    (values_in_hand.include?(current_card_in_pile.value) ||
    values_in_hand.include?(8) || values_in_hand.include?(self.wild_card_suit))
  end

  def handle_card(player, card)

    if card.value == :eight
      puts "Set wild card suit"
      puts "Options: ##{Card.suits}"
      wild_card = gets.chomp.to_sym
      self.wild_card_suit = wild_card
      self.discard_pile << card
      player.hand.cards.delete(card)
    elsif card.value == current_card_in_pile.value ||
          card.suit == current_card_in_pile.suit
      self.wild_card_suit = ''
      self.discard_pile << card
      player.hand.cards.delete(card)
    end

  end


end
# player = Player.new(gets.chomp, deck)
game = Game.new

game.play

# game.players.each do |player|
#   p player.show_hand
# end
