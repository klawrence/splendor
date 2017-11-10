require 'test_helper'

class GameTest < Minitest::Test
  def setup
    @game = Splendor::Game.new
  end

  def test_game_has_4_players
    assert_equal 4, @game.players.count
  end

  def test_start_with_12_cards
    assert_equal 12, @game.cards_on_table.flatten.count
  end

  def test_each_level_has_4_cards
    (1..3).each { |level|
      cards_in_level = @game.cards_on_table[level-1]
      assert_equal 4, cards_in_level.count
      4.times { |i| assert_equal level, cards_in_level[i].level }
    }
  end

end
