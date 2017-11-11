module Splendor
  module Setup
    def setup
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
      @cards = (1..3).map {|level|
        (1..4).map {|_column| next_card(level)}
      }
    end

    def place_gems
      @gems = {}

      Splendor::GEMS.each do |gem|
        @gems[gem] = 7
      end

      @gems[:gold] = 5
    end

    def place_nobles
      all_nobles = Splendor::Noble.load_nobles
      @nobles = all_nobles.shuffle[1..5]
    end

    def add_players
      @players = Splendor::Player.create_players 4
      @current_player = @players.first
    end
  end
end