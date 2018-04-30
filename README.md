# Mf

Modifier functions. More of an experiment for now with syntactic sugar operators
after an idea occurred:

Can Ruby define `self` infix operators and `curry` / `proc`ify them?

Turns out the answer is yes, yes it can:

```ruby
[1,2,3,4,5].map(&Mf + 5)
# => [6, 7, 8, 9, 10]
```

(I should probably put down the Scala book now)

## Usage

Just a quick rundown of the methods for now

```ruby
numbers = [1, 2, 3, 4, 5]
# => [1, 2, 3, 4, 5]

numbers.map(&Mf + 5)
# => [6, 7, 8, 9, 10]

numbers.map(&Mf - 5)
# => [-4, -3, -2, -1, 0]

numbers.map(&Mf * 5)
# => [5, 10, 15, 20, 25]

numbers.map(&Mf / 5.0)
# => [0.2, 0.4, 0.6, 0.8, 1.0]

numbers.map(&Mf % 5)
# => [1, 2, 3, 4, 0]

numbers.map(&Mf ** 5)
# => [1, 32, 243, 1024, 3125]

numbers.select(&Mf > 3)
# => [4, 5]

numbers.select(&Mf >= 3)
# => [3, 4, 5]

numbers.select(&Mf < 3)
# => [1, 2]

numbers.select(&Mf <= 3)
# => [1, 2, 3]

numbers.map(&Mf <=> 3)
#=> [-1, -1, 0, 1, 1]

numbers.select(&Mf == 3)
#=> [3]

numbers.select(&Mf === 1..10)
#=> [1, 2, 3, 4, 5]

numbers.map(&Mf >> 3)
#=> [0, 0, 0, 0, 0]

numbers.map(&Mf << 3)
#=> [8, 16, 24, 32, 40]

numbers.map(&Mf | 3)
#=> [3, 3, 3, 7, 7]

numbers.map(&Mf & 3)
#=> [1, 2, 3, 0, 1]

%w(foo bar baz).map(&Mf[0..1])
=> ["fo", "ba", "ba"]
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mf'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mf

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/baweaver/mf. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mf project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/baweaver/mf/blob/master/CODE_OF_CONDUCT.md).
