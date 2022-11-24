# frozen_string_literal: true

module EOL
  class Client
    # Class for retrieving information about Products
    class Product
      class NotFoundError < StandardError; end

      class << self
        def all(client)
          client.get("/all.json")
        end

        def get(client, product)
          res = client.get("/#{product}.json")
          raise NotFoundError, "Product #{product} could not be found in the API" if res.status == 404

          res
        end
      end
    end
  end
end
