require_relative 'player'
require_relative 'deck'

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

  attr_accessor :deck, :players, :discard_pile

  def initialize(deck = Deck.new)
    @deck = deck
    @players = Game.create_players(deck)
    @discard_pile = deck.take(1)
    # @current_player = players.first
  end

  def take_turn(player)
    if self.valid_hand?
      puts player.show_hand
      current_card = self.get_card(player)
    end



    end

  end

  def current_card_in_pile
    puts self.discard_pile.last
  end

  def won?
    self.players.any? {|player| player.hand_count == 0}
  end

  def play
    self.current_card_in_pile

    until deck.count == 0
      players.each do |player|
        self.take_turn(player)
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
    suits_in_hand = player.hand.cards.map do {|card| card.suit}
    values_in_hand = player.hand.cards.map do {|card| card.values}

    suits_in_hand.include?(current_card_in_pile.suit) ||
    values_in_hand.include?(current_card_in_pile.value)
  end


end
# player = Player.new(gets.chomp, deck)
game = Game.new

p game.players.first.show_hand
p game.get_card(game.players.first)

# game.players.each do |player|
#   p player.show_hand
# end
