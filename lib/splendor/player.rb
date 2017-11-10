module Splendor
  class Player
    NAMES = %w(Harry Larry Barry Sally)

    attr_reader :name, :gems, :cards

    def initialize name
      @name = name
      @gems = Hash.new(0)
      @cards = Hash.new{|hash, key| hash[key] = []}
    end

    def add_gem gem
      gems[gem] += 1
    end

    def add_card card
      cards[card.gem] << card
    end

    def self.create_players count
      players = []
      count.times{ |i| players << Player.new( NAMES[i]) }
      players
    end
  end
end