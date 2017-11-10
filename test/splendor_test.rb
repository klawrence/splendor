require "test_helper"

class SplendorTest < Minitest::Test
  def test_version_number
    refute_nil ::Splendor::VERSION
  end
end
