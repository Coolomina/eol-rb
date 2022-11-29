# frozen_string_literal: true

require_relative "eol_rb/client"
require_relative "eol_rb/configuration"
require_relative "eol_rb/products"
require_relative "eol_rb/cycle"

# Root module for EndOfLife
module EOL
  class << self
    extend Forwardable

    def_delegators :new, :of, :products

    def new
      Instance.new
    end

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

  # Instance of EOL HTTP client
  class Instance
    def initialize
      @client = Client.new
    end

    def products
      Products.all(@client)
    end

    def of(product, cycle: "")
      if cycle.empty?
        Products.get(@client, product)
      else
        Cycle.get(@client, product, cycle)
      end
    end
  end
end
