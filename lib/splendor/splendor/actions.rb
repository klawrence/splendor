module Splendor
  module Actions
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

    def buy_card player, level, column
      # TODO check choices are valid
      card = card_at level, column

      cards[level-1][column] = next_card(level)
      player.add_card card

      card.cost.gems.each {|gem, cost|
        gems[gem] += cost
        player.gems[gem] -= cost
      }
    end
  end
end