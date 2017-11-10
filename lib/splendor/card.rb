require 'yaml'

module Splendor
  GEMS = [ :diamond, :ruby, :emerald, :sapphire, :onyx, :gold]

  class Card

    attr_reader :level, :gem

    def initialize level, gem
      @level = level
      @gem = gem
    end

    def self.load_cards
      entries = YAML.load_file 'config/cards.yml'
      entries.map do |entry|
        card = Card.new entry['level'], entry['gem']
        # entry['cost'].each do |gem, cost|
        #   card.costs << Cost.new gem
        # end
      end
    end

  end
end
