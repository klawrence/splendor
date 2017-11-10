require 'yaml'

module Splendor
  class Cost

    def initialize cost
      @cost = cost
    end

    def to_s
      @cost.map{|gem, amount| "#{gem}: #{amount}"}.join("\n")
    end

  end
end
