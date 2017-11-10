require 'splendor/player'
require 'splendor/card'
require 'splendor/noble'

module Splendor
  class Game
    attr_accessor :players, :next_player, :cards_on_table, :gem_stacks

    def initialize
      load_cards
      deal_cards
      place_gems
      place_nobles
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
          @cards_on_table[level] << next_card(level)
        }
      }
    end

    def place_gems
      @gem_stacks = {}

      Splendor::GEMS.each do |gem|
        @gem_stacks[gem] = 7
      end

      @gem_stacks['gold'] = 5
    end

    def place_nobles
      all_nobles = Splendor::Noble.load_nobles
      @nobles = all_nobles.shuffle[1..5]
    end

    def add_players
      @players = Splendor::Player.create_players 4
      @next_player = @players.first
    end

    def card_at level, column
      cards_on_table[level][column]
    end

    def next_card level
      @cards_by_level[level].pop
    end

    def take_three_gems player, gems
      # TODO check choices are valid
      gems.each do |gem|
        take_gem player, gem
      end
    end

    def take_two_gems_of_same_color player, gem
      # TODO check choices are valid
      2.times do
        take_gem player, gem
      end
    end

    def take_card player, level, column
      card = card_at level, column

      cards_on_table[level][column] = next_card(level)
      player.add_card card
    end

    private
    def take_gem player, gem
      gem_stacks[gem] -= 1
      player.add_gem gem
    end
  end
end