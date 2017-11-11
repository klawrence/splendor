require 'test_helper'

class PlayerTest < Minitest::Test

  def setup
    @player = Splendor::Player.new 'sandra'
  end

  def test_add_points_if_you_add_card
    definition = {'gem' => :diamond, 'cost' => {}, 'points' => 1}
    card = Splendor::Card.new definition

    assert_equal 0, @player.points
    @player.add_card card
    assert_equal 1, @player.points
  end
end
