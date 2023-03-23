# frozen_string_literal: true

require "eol_rb"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.before(:each) do
    @stubs = Faraday::Adapter::Test::Stubs.new
    @conn = Faraday.new { |b| b.adapter(:test, @stubs) }
  end
  config.after { Faraday.default_connection = nil }
end
