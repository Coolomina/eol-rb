# frozen_string_literal: true

require "json"

module EOL
  # Class for retrieving information about Products
  class Products
    class NotFoundError < StandardError; end

    class << self
      def all(client)
        JSON.parse(client.get("/all.json").body)
      end

      def get(client, product)
        res = client.get("/#{product}.json")
        raise NotFoundError, "Product #{product} could not be found in the API" if res.status == 404

        JSON.parse(res.body).map { |p| Models::Cycle.new(p) }
      end
    end
  end
end
