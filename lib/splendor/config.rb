module Splendor
  module Config
    def self.config_dir
      File.join Splendor.root_dir, 'config'
    end

    def self.config_file name
      File.join config_dir, name
    end

    def self.cards_file
      config_file 'cards.yml'
    end

    def self.nobles_file
      config_file 'nobles.yml'
    end

  end
end