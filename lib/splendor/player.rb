module Splendor
  class Player
    NAMES = %w(Harry Larry Barry Sally)

    attr_reader :name

    def initialize name
      @name = name
    end

    def self.create_players count
      players = []
      count.times{ |i| players << Player.new( NAMES[i]) }
      players
    end
  end
end