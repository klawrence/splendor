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
      current_player.add_card card

      card.cost.gems.each {|gem, cost|
        gems[gem] += cost
        current_player.gems[gem] -= cost
      }

      next_card = next_card level
      replace_card_at level, column, next_card

      advance_turn

      card
    end

  end
end