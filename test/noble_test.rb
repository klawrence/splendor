require 'test_helper'

class NobleTest < Minitest::Test

  def setup
    @nobles = Splendor::Noble.load_nobles
  end

  def test_there_are_10_nobles
    assert_equal 10, @nobles.count
  end

  def test_each_noble_has_a_cost
    expected_cost = <<END
onyx: 3
ruby: 3
diamond: 3
END
    assert_equal expected_cost.strip, @nobles.first.cost.to_s
  end


end
