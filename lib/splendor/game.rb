require 'splendor/player'
require 'splendor/card'
require 'splendor/noble'

module Splendor
  require_relative 'splendor/setup.rb'

  require_relative 'splendor/actions.rb'


  class Game
    include Splendor::Setup
    include Splendor::Actions

    attr_accessor :cards, :nobles, :gems, :players, :next_player

    def initialize
      setup
    end

    def card_at level, column
      cards[level-1][column]
    end

    def next_card level
      @cards_by_level[level-1].pop
    end

    private
    def take_gem player, gem
      gems[gem] -= 1
      player.add_gem gem
    end
  end
end