# endoflife.date ruby gem

`eol_rb` is an endoflife.date Ruby wrapper built on top of Faraday. 

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add eol_rb

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install eol_rb

## Usage

```ruby
require 'eol_rb'

# Optional configuration
EOL.configure do |config|
  config.timeout = 1
  config.open_timeout = 1
end

EOL.products
# => ["almalinux", "alpine", "amazon-eks", ...

EOL.info('ruby')
# => 
# [#<EOL::Models::Cycle:0x000000010403dd60             
#  @eol=#<Date: 2026-03-31 ((2461131j,0s,0n),+0s,2299161j)>,
#  @is_supported=true,                                
#  @latest=Gem::Version.new("3.2.1"),                 
#  @latest_release_date=#<Date: 2023-02-08 ((2459984j,0s,0n),+0s,2299161j)>,
#  @lts=false,                                        
#  @release_date=#<Date: 2022-12-25 ((2459939j,0s,0n),+0s,2299161j)>,
#  @version=Gem::Version.new("3.2")>, 

EOL.info('ruby', cycle: '3.1')
# => 
# #<EOL::Models::Cycle:0x0000000104044890
#  @eol=#<Date: 2025-03-31 ((2460766j,0s,0n),+0s,2299161j)>,
#  @is_supported=true,
#  @latest=Gem::Version.new("3.1.3"),
#  @latest_release_date=#<Date: 2022-11-24 ((2459908j,0s,0n),+0s,2299161j)>,
#  @lts=false,
#  @release_date=#<Date: 2021-12-25 ((2459574j,0s,0n),+0s,2299161j)>,
#  @version=Gem::Version.new("3.1")>

EOL.info('ruby', cycle: '2.6').supported?
# => false
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
