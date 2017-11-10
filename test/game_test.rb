require 'test_helper'

class GameTest < Minitest::Test
  def setup
    @game = Splendor::Game.new
  end

  def test_game_has_four_players
    assert_equal 4, @game.players.count
  end

  def test_game_starts_with_12_cards_on_the_table
    assert_equal 12, @game.cards_on_table.flatten.count
  end
end
