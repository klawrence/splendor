require 'splendor/player'
require 'splendor/card'

module Splendor
  class Game
    attr_accessor :players, :cards_on_table

    def initialize
      load_cards
      deal_cards
      add_players
    end

    def load_cards
      @cards_by_level = [
          [],
          [],
          []
      ]
      cards = Splendor::Card.load_cards
      cards.shuffle.each do |card|
        @cards_by_level[card.level - 1] << card
      end
    end

    def deal_cards
      @cards_on_table = [
          [],
          [],
          []
      ]
      3.times { |level|
        4.times {
          @cards_on_table[level] << @cards_by_level[level].pop
        }
      }
    end

    def add_players
      @players = Splendor::Player.create_players 4
    end
  end
end