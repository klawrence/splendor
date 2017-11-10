require 'splendor/version'
require 'splendor/config'
require 'splendor/game'

module Splendor
  GEMS = %w(diamond ruby emerald sapphire onyx gold)

  def self.root_dir
    File.dirname __dir__
  end
end
