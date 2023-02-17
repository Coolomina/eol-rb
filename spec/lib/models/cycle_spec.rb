# frozen_string_literal: true

RSpec.describe EOL::Models::Cycle do
  let(:specs) do
    {
      "cycle" => "3.1",
      "eol" => "2021-01-31",
      "latest" => "3.2.1",
      "latestReleaseDate" => "2020-01-01",
      "releaseDate" => "2019-01-01",
      "lts" => false
    }
  end
  let(:cycle) { described_class.new(specs) }

  describe ".new" do
    it "returns a Cycle object" do
      expect(cycle).to have_attributes(
        version: Gem::Version.new("3.1"),
        eol: Date.new(2021, 1, 31),
        latest: Gem::Version.new("3.2.1"),
        latest_release_date: Date.new(2020, 1, 1),
        release_date: Date.new(2019, 1, 1),
        lts: false
      )
    end
  end

  describe ".supported?" do
    it "returns whether the cycle is supported or not" do
      expect(cycle.supported?).to eq(false)
    end
  end
end
