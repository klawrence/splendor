require 'splendor/cost'

module Splendor
  class Noble
    attr_reader :points, :cost

    def initialize definition
      @points = definition['points']
      @cost = Splendor::Cost.new(definition['cost'])
    end

    def self.load_nobles
      entries = YAML.load_file filename

      # TODO fix this when we have all 10 nobles
      (entries * 5).map do |definition|
        Noble.new definition
      end
    end

    def to_s
      "#{points} points"
    end

    def self.filename
      Splendor.config_file 'nobles.yml'
    end
  end
end
