require 'splendor/cost'

module Splendor
  class Card

    attr_reader :level, :gem, :points, :cost

    def initialize definition
      @level = definition['level']
      @gem = definition['gem']
      @points = definition['points']
      @cost = Splendor::Cost.new(definition['cost'])
    end

    def self.load_cards
      entries = YAML.load_file filename

      # TODO fix this when we have all 90 cards
      (entries * 10).map do |definition|
        Card.new definition
      end
    end

    def to_s
      "LEVEL #{level}: #{gem} #{points} points"
    end

    def self.filename
      Splendor.config_file 'cards.yml'
    end
  end
end
