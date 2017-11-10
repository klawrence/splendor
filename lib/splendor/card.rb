require 'splendor/cost'

module Splendor
  GEMS = %w(diamond ruby emerald sapphire onyx gold)

  class Card

    attr_reader :level, :gem, :cost

    def initialize level, gem, cost
      @level = level
      @gem = gem
      @cost = cost
    end

    def self.load_cards
      entries = YAML.load_file 'config/cards.yml'
      entries.map do |entry|
        Card.new entry['level'], entry['gem'], Splendor::Cost.new(entry['cost'])
      end
    end

  end
end
