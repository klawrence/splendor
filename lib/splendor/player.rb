module Splendor
  class Player
    NAMES = %w(Harry Larry Barry Sally)

    attr_reader :name, :gem_stacks

    def initialize name
      @name = name
      @gem_stacks = Hash.new(0)
    end

    def add_gem gem
      gem_stacks[gem] += 1
    end

    def self.create_players count
      players = []
      count.times{ |i| players << Player.new( NAMES[i]) }
      players
    end
  end
end