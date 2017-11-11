module Splendor
  module Actions

    def take_three_gems gems
      # TODO check choices are valid
      gems.each do |gem|
        take_gem gem
      end

      advance_turn
    end

    def take_two_gems_of_same_color gem
      # TODO check choices are valid
      2.times do
        take_gem gem
      end

      advance_turn
    end

    def buy_card level, column
      # TODO check choices are valid
      card = card_at level, column

      cards[level-1][column] = next_card(level)
      current_player.add_card card

      card.cost.gems.each {|gem, cost|
        gems[gem] += cost
        current_player.gems[gem] -= cost
      }

      advance_turn

      card
    end
  end
end