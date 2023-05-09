# frozen_string_literal: true

RSpec.describe EOL::Client do
  describe ".new" do
    let(:client) { described_class.new }

    it "sets user-agent with the gem version" do
      user_agent = "endoflife.date Ruby Gem v#{EOL::VERSION}"

      expect(client.http.headers["User-Agent"]).to eq(user_agent)
    end
  end

  describe ".get" do
    let(:client) { described_class.new(@conn) }

    it "properly makes calls to the API" do
      @stubs.get("/api/ruby.json") do
        [
          200,
          { "Content-Type": "application/json" },
          '[{
            "cycle": "3.2",
            "eol": "2026-03-31",
            "latest": "3.2.1",
            "latestReleaseDate": "2023-02-08",
            "releaseDate": "2022-12-25",
            "lts": false
          }]'
        ]
      end

      client.get("ruby.json")
    end
  end
end
