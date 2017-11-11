require 'splendor/version'
require 'splendor/config'
require 'splendor/game'

module Splendor
  GEMS = [:diamond, :ruby, :emerald, :sapphire, :onyx]

  def self.root_dir
    File.dirname __dir__
  end
end
