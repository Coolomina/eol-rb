# frozen_string_literal: true

module EOL
  module Models
    # EOL Cycle model https://endoflife.date/docs/api
    class Cycle
      attr_reader :version, :eol, :latest, :latest_release_date, :release_date, :lts

      def initialize(specs)
        @version = Gem::Version.new(specs.fetch("cycle"))
        @eol = Date.parse(specs.fetch("eol"))
        @latest = Gem::Version.new(specs.fetch("latest"))
        @latest_release_date = Date.parse(specs.fetch("latestReleaseDate"))
        @release_date = Date.parse(specs.fetch("releaseDate"))
        @lts = specs.fetch("lts")
      end

      def supported?
        @eol > Time.now.to_date
      end
    end
  end
end
