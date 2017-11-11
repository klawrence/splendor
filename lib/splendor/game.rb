require 'splendor/player'
require 'splendor/card'
require 'splendor/noble'

module Splendor
  require_relative 'splendor/setup.rb'
  require_relative 'splendor/actions.rb'

  class Game
    include Splendor::Setup
    include Splendor::Actions

    attr_reader :cards, :nobles, :gems, :players, :current_player

    def initialize
      setup
    end

    def advance_turn
      index = players.find_index current_player
      @current_player = players[(index+1) % players.count]
    end


    def card_at level, column
      cards[level-1][column]
    end

    def next_card level
      @cards_by_level[level-1].pop
    end

    def take_gem gem
      gems[gem] -= 1
      current_player.add_gem gem
    end
  end
end