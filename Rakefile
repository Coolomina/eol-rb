# frozen_string_literal: true

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]

task :release do |t|
  version = "v#{EOL::VERSION}"
  sh("git tag -a #{version} -m \"Tags #{version}\"")
  sh("git push origin #{version}")
end
