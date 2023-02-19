# frozen_string_literal: true

RSpec.describe EOL::Models::Cycle do
  let(:specs_out_of_date) do
    {
      "cycle" => "3.1",
      "eol" => "2021-01-31",
      "latest" => "3.2.1",
      "latestReleaseDate" => "2020-01-01",
      "releaseDate" => "2019-01-01",
      "lts" => false
    }
  end

  let(:specs_up_to_date) do
    {
      "cycle" => "3.1",
      "eol" => "3000-01-31",
      "latest" => "3.2.1",
      "latestReleaseDate" => "2020-01-01",
      "releaseDate" => "2019-01-01",
      "lts" => false
    }
  end

  let(:cycle_out_of_date) { described_class.new(specs_out_of_date) }
  let(:cycle_up_to_date) { described_class.new(specs_up_to_date) }

  describe ".new" do
    it "returns a Cycle object" do
      expect(cycle_out_of_date).to have_attributes(
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
    it "returns false when the Cycle is out of date" do
      expect(cycle_out_of_date.supported?).to eq(false)
    end

    it "returns true when the Cycle is up to date" do
      expect(cycle_up_to_date.supported?).to eq(true)
    end
  end
end
