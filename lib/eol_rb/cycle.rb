# frozen_string_literal: true

module EOL
  class Client
    # Class for retrieving information about Cycles
    class Cycle
      class NotFoundError < StandardError; end

      class << self
        def get(client, product, cycle)
          res = client.get("/#{product}/#{cycle}.json")
          raise NotFoundError, "Cycle #{cycle} could not be found under product #{product}" if res.status == 404

          res
        end
      end
    end
  end
end
