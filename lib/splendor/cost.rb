require 'yaml'

module Splendor
  class Cost
    attr_reader :gems

    def initialize gems
      @gems = gems
    end

    def to_s
      gems.map{|gem, amount| "#{gem}: #{amount}"}.join("\n")
    end

  end
end
