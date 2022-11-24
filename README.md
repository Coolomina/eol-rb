# endoflife.date ruby gem

`eol_rb` is an endoflife.date Ruby wrapper built on top of Faraday. 

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add eol_rb

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install eol_rb

## Usage

```ruby
# Optional configuration
require 'eol_rb'

EOL.configure do |config|
  config.timeout = 1
  config.open_timeout = 1
end

EOL.products
# => ["almalinux", "alpine", "amazon-eks", ...

EOL.of('ruby')
# => 
# [{"cycle"=>"3.1", "eol"=>"2025-12-25", "latest"=>"3.1.2", "latestReleaseDate"=>"2022-04-12", "releaseDate"=>"2021-12-25"},
#  {"cycle"=>"3.0", "eol"=>"2024-03-31", "latest"=>"3.0.4", "latestReleaseDate"=>"2022-04-12", "releaseDate"=>"2020-12-25"},
# ...

EOL.of('ruby', cycle: '3.1')
# => {"eol"=>"2025-12-25", "latest"=>"3.1.2", "latestReleaseDate"=>"2022-04-12", "releaseDate"=>"2021-12-25"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/eol_rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/eol_rb/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EolRb project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/eol_rb/blob/master/CODE_OF_CONDUCT.md).
