# frozen_string_literal: true

module EOL
  # Configuration class for EndOfLife HTTP client
  class Configuration
    SETTINGS = %i[timeout open_timeout].freeze
    attr_accessor(*SETTINGS)

    def reset!
      SETTINGS.each { |s| instance_variable_set(:"@#{s}", nil) }
    end
  end
end
