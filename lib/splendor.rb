require 'splendor/version'
require 'splendor/game'

module Splendor
  GEMS = %w(diamond ruby emerald sapphire onyx gold)

  def self.root_dir
    File.dirname __dir__
  end

  def self.config_dir
    File.join root_dir, 'config'
  end

  def self.config_file name
    File.join Splendor.config_dir, name
  end
end
