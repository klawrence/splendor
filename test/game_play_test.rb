require 'test_helper'

class GamePlayTest < Minitest::Test
  def setup
    @game = Splendor::Game.new
  end

  def test_first_players_turn
    assert_equal @game.players.first, @game.next_player
  end

  def test_take_three_gems
    player = @game.players.first

    @game.take_three_gems player, [:diamond, :ruby, :onyx]

    assert_equal 1, player.gem_stacks[:diamond]
    assert_equal 1, player.gem_stacks[:ruby]
    assert_equal 1, player.gem_stacks[:onyx]
    assert_equal 0, player.gem_stacks[:sapphire]
    assert_equal 0, player.gem_stacks[:emerald]

    assert_equal 6, @game.gem_stacks[:diamond]
    assert_equal 6, @game.gem_stacks[:ruby]
    assert_equal 6, @game.gem_stacks[:onyx]
    assert_equal 7, @game.gem_stacks[:sapphire]
    assert_equal 7, @game.gem_stacks[:emerald]
  end

  def test_take_two_gems_same_colour
    player = @game.players.first

    @game.take_two_gems_of_same_color player, :diamond

    assert_equal 2, player.gem_stacks[:diamond]
    assert_equal 0, player.gem_stacks[:ruby]
    assert_equal 0, player.gem_stacks[:onyx]
    assert_equal 0, player.gem_stacks[:sapphire]
    assert_equal 0, player.gem_stacks[:emerald]

    assert_equal 5, @game.gem_stacks[:diamond]
    assert_equal 7, @game.gem_stacks[:ruby]
    assert_equal 7, @game.gem_stacks[:onyx]
    assert_equal 7, @game.gem_stacks[:sapphire]
    assert_equal 7, @game.gem_stacks[:emerald]
  end

  def test_take_a_card
    player = @game.players.first

    level = 1
    column = 2

    card = @game.card_at(level, column)

    @game.take_card player, level, column

    assert_equal card, player.cards[card.gem].first
    refute_equal card, @game.card_at(level, column)
  end
end
