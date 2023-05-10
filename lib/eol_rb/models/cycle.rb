# frozen_string_literal: true

module EOL
  module Models
    # EOL Cycle model https://endoflife.date/docs/api
    class Cycle
      attr_reader :version, :eol, :latest, :latest_release_date, :release_date, :lts

      def initialize(specs)
        @version = Gem::Version.new(specs.fetch("cycle"))
        @eol = parse_eol(specs.fetch("eol"))
        @latest = Gem::Version.new(specs.fetch("latest"))
        @latest_release_date = Date.parse(specs.fetch("latestReleaseDate"))
        @release_date = Date.parse(specs.fetch("releaseDate"))
        @lts = specs.fetch("lts")
      end

      def supported?
        return !eol if [true, false].include? eol

        @eol > Time.now.to_date
      end

      private

      def parse_eol(eol)
        return false if eol.nil?
        return eol if [true, false].include? eol
        return Date.parse(eol) if eol.is_a? String

        nil
      end
    end
  end
end
