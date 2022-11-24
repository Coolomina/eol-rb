# frozen_string_literal: true

require "faraday"
require "uri"
require "json"

module EOL
  # HTTP client for endoflife.date API
  class Client
    def initialize
      @http = Faraday.new(
        url: "#{api.scheme}://#{api.host}",
        headers: {
          "Content-Type" => "application/json",
          "User-Agent" => "endoflife.date Ruby Gem v#{EOL::VERSION}"
        }
      )
    end

    def get(endpoint)
      @http.get("#{api.path}/#{endpoint}")
    end

    private

    EOL_DATE_API_BASE_URL = "https://endoflife.date/api"

    def api
      URI(EOL_DATE_API_BASE_URL)
    end

    def open_timeout
      EOL.configuration.open_timeout || 10
    end

    def timeout
      EOL.configuration.timeout || 10
    end
  end
end
