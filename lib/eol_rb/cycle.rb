# frozen_string_literal: true

require "json"

module EOL
  # Class for retrieving information about Cycles
  class Cycle
    class NotFoundError < StandardError; end

    class << self
      def get(client, product, cycle)
        res = client.get("/#{product}/#{cycle}.json")

        if res.status == 404
          available_cycles = []
          Products.get(client, product).each do |p|
            available_cycles.push(p["cycle"])
          end

          raise NotFoundError,
                "Cycle #{cycle} could not be found under product #{product}. Try any of #{available_cycles.inspect}"
        end

        JSON.parse(res.body)
      end
    end
  end
end
