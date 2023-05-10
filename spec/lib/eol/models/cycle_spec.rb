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

  let(:specs_boolean_unsupported) do
    {
      "cycle" => "5.0",
      "eol" => true,
      "support" => "2018-04-09",
      "latest" => "5.0.7.2",
      "latestReleaseDate" => "2019-03-13",
      "releaseDate" => "2016-06-30",
      "lts" => false
    }
  end

  let(:specs_boolean_supported) do
    {
      "cycle" => "7.0",
      "eol" => false,
      "latest" => "7.0.4.3",
      "latestReleaseDate" => "2023-03-13",
      "releaseDate" => "2021-12-15",
      "lts" => false
    }
  end

  let(:cycle_out_of_date) { described_class.new(specs_out_of_date) }
  let(:cycle_up_to_date) { described_class.new(specs_up_to_date) }
  let(:cycle_boolean_unsupported) { described_class.new(specs_boolean_unsupported) }
  let(:cycle_boolean_supported) { described_class.new(specs_boolean_supported) }

  describe ".new" do
    context "with a datestring eol" do
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
    context "with a boolean eol" do
      it "returns a Cycle object" do
        expect(cycle_boolean_supported).to have_attributes(
          version: Gem::Version.new("7.0"),
          eol: false,
          latest: Gem::Version.new("7.0.4.3"),
          latest_release_date: Date.new(2023, 3, 13),
          release_date: Date.new(2021, 12, 15),
          lts: false
        )
      end
    end
  end

  describe ".supported?" do
    context "with datetime eol" do
      it "returns false when the Cycle is out of date" do
        expect(cycle_out_of_date.supported?).to eq(false)
      end

      it "returns true when the Cycle is up to date" do
        expect(cycle_up_to_date.supported?).to eq(true)
      end
    end
    context "with boolean eol" do
      it "returns false when the Cycle is out of date" do
        expect(cycle_boolean_unsupported.supported?).to eq(false)
      end

      it "returns true when the Cycle is up to date" do
        expect(cycle_boolean_supported.supported?).to eq(true)
      end
    end
  end
end
