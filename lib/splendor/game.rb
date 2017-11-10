require 'splendor/player'

module Splendor
  class Game
    attr_accessor :players

    def initialize
      add_players
    end

    def add_players
      @players = Splendor::Player.create_players 4
    end
  end
end