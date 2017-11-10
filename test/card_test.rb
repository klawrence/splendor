require 'test_helper'

class CardTest < Minitest::Test

  def setup
    @cards = Splendor::Card.load_cards
  end

  def test_there_are_90_cards
    assert_equal 90, @cards.count
    assert_equal 40, @cards.select{|c| c.level == 1}.count
    assert_equal 30, @cards.select{|c| c.level == 2}.count
    assert_equal 20, @cards.select{|c| c.level == 3}.count
  end

  def test_each_card_has_a_cost
    expected_cost = <<END
sapphire: 1
ruby: 2
onyx: 2
END

    assert_equal expected_cost.strip, @cards[0].cost.to_s
  end


end
