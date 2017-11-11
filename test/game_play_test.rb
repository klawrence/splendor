require 'test_helper'

class GamePlayTest < Minitest::Test
  def setup
    @game = Splendor::Game.new
  end

  def test_first_players_turn
    assert_equal @game.players.first, @game.current_player
  end

  def test_take_three_gems
    player = @game.players.first

    @game.take_three_gems [:diamond, :ruby, :onyx]

    assert_equal 1, player.gems[:diamond]
    assert_equal 1, player.gems[:ruby]
    assert_equal 1, player.gems[:onyx]
    assert_equal 0, player.gems[:sapphire]
    assert_equal 0, player.gems[:emerald]

    assert_equal 6, @game.gems[:diamond]
    assert_equal 6, @game.gems[:ruby]
    assert_equal 6, @game.gems[:onyx]
    assert_equal 7, @game.gems[:sapphire]
    assert_equal 7, @game.gems[:emerald]
  end

  def test_take_two_gems_same_colour
    player = @game.players.first

    @game.take_two_gems_of_same_color :diamond

    assert_equal 2, player.gems[:diamond]
    assert_equal 0, player.gems[:ruby]
    assert_equal 0, player.gems[:onyx]
    assert_equal 0, player.gems[:sapphire]
    assert_equal 0, player.gems[:emerald]

    assert_equal 5, @game.gems[:diamond]
    assert_equal 7, @game.gems[:ruby]
    assert_equal 7, @game.gems[:onyx]
    assert_equal 7, @game.gems[:sapphire]
    assert_equal 7, @game.gems[:emerald]
  end

  def test_buy_a_card
    player = @game.current_player

    card = Splendor::Card.new 'gem' => :diamond, 'cost' => { ruby: 2, onyx: 1 }, 'points' => 1
    level = 1
    column = 2

    card = @game.replace_card_at level, column, card

    # make sure the player can afford it
    @game.take_gem :ruby
    @game.take_gem :ruby
    @game.take_gem :onyx

    @game.buy_card level, column

    assert_equal card, player.cards[card.gem].first
    refute_equal card, @game.card_at(level, column)

    assert_equal 7, @game.gems[:ruby]
    assert_equal 7, @game.gems[:onyx]
    assert_equal 0, player.gems[:ruby]
    assert_equal 0, player.gems[:onyx]

    refute_equal player, @game.current_player
  end
end
