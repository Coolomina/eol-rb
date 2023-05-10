# frozen_string_literal: true

RSpec.describe EOL::Models::Cycle do
  let(:specs) do
    {
      out_of_date => {
        input => {
          "cycle" => "3.1",
          "eol" => "2021-01-31",
          "latest" => "3.2.1",
          "latestReleaseDate" => "2020-01-01",
          "releaseDate" => "2019-01-01",
          "lts" => false
        },
        expected => {
          version: Gem::Version.new("3.1"),
          eol: Date.new(2021, 1, 31),
          latest: Gem::Version.new("3.2.1"),
          latest_release_date: Date.new(2020, 1, 1),
          release_date: Date.new(2019, 1, 1),
          lts: false
        }
      },
      up_to_date => {
        input => {
          "cycle" => "3.1",
          "eol" => "3000-01-31",
          "latest" => "3.2.1",
          "latestReleaseDate" => "2020-01-01",
          "releaseDate" => "2019-01-01",
          "lts" => false
        },
        output => {
          version: Gem::Version.new("7.0"),
          eol: false,
          latest: Gem::Version.new("7.0.4.3"),
          latest_release_date: Date.new(2023, 3, 13),
          release_date: Date.new(2021, 12, 15),
          lts: false
        }
      },
      boolean_unsupported => {
        input => {
          "cycle" => "5.0",
          "eol" => true,
          "support" => "2018-04-09",
          "latest" => "5.0.7.2",
          "latestReleaseDate" => "2019-03-13",
          "releaseDate" => "2016-06-30",
          "lts" => false
        }
      },
      boolean_supported => {
        input => {
          "cycle" => "7.0",
          "eol" => false,
          "latest" => "7.0.4.3",
          "latestReleaseDate" => "2023-03-13",
          "releaseDate" => "2021-12-15",
          "lts" => false
        }
      }
    }
  end

  let(:cycle_out_of_date) { described_class.new(specs[:out_of_date][:input]) }
  let(:cycle_up_to_date) { described_class.new(specs[:up_to_date][:input]) }
  let(:cycle_boolean_unsupported) { described_class.new(specs[:boolean_unsupported][:input]) }
  let(:cycle_boolean_supported) { described_class.new(specs[:boolean_supported][:input]) }

  describe ".new" do
    context "with a datestring eol" do
      it "returns a Cycle object" do
        expect(cycle_out_of_date).to have_attributes(
          specs[:out_of_date][:output]
        )
      end
    end

    context "with a boolean eol" do
      it "returns a Cycle object" do
        expect(cycle_boolean_supported).to have_attributes(
          specs[:boolean_supported][:output]
        )
      end
    end
  end

  describe ".supported?" do
    context "with datetime eol" do
      it "returns false when the Cycle is out of date" do
        expect(cycle_out_of_date.supported?).to be(false)
      end

      it "returns true when the Cycle is up to date" do
        expect(cycle_up_to_date.supported?).to be(true)
      end
    end

    context "with boolean eol" do
      it "returns false when the Cycle is out of date" do
        expect(cycle_boolean_unsupported.supported?).to be(false)
      end

      it "returns true when the Cycle is up to date" do
        expect(cycle_boolean_supported.supported?).to be(true)
      end
    end
  end
end
