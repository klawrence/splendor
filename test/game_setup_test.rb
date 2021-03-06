require 'test_helper'

class GameSetupTest < Minitest::Test
  def setup
    @game = Splendor::Game.new
  end

  def test_game_has_4_players
    assert_equal 4, @game.players.count
  end

  def test_start_with_12_cards
    assert_equal 12, @game.cards.flatten.count
  end

  def test_each_level_has_4_cards
    (1..3).each { |level|
      cards_in_level = @game.cards[level-1]
      assert_equal 4, cards_in_level.count
      4.times { |i| assert_equal level, cards_in_level[i].level }
    }
  end

  def test_there_are_6_stacks_of_gems
    assert_equal 6, @game.gems.count
    assert_equal 7, @game.gems[:diamond]
    assert_equal 5, @game.gems[:gold]
  end

  def test_there_are_5_nobles
    assert_equal 5, @game.nobles.count
  end


end
