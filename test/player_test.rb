require 'test_helper'

class PlayerTest < Minitest::Test

  def setup
    @player = Splendor::Player.new 'sandra'
  end

  def test_add_points_if_you_buy_card
    assert_equal 0, @player.points

    card = Splendor::Card.new 'gem' => :diamond, 'cost' => {}, 'points' => 1
    @player.add_card card

    assert_equal 1, @player.points
  end

  def test_can_i_afford_a_card?
    card = Splendor::Card.new 'gem' => :diamond, 'cost' => { ruby: 2, onyx: 1 }, 'points' => 1

    refute @player.can_afford? card

    @player.add_gem :ruby
    @player.add_gem :onyx
    refute @player.can_afford? card

    @player.add_gem :ruby
    assert @player.can_afford? card
  end
end
