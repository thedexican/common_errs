# CommonErrs

Add Active Record-like errors to non AR models.

## Installation

Add this line to your application's Gemfile:

    gem 'common_errs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install common_errs

## Usage
```
  class Bunk
    include CommonErrs
    has_common_errs({separator: "--"}) #optional, default separator => ", "
  end

  Example 1:
  bunk = Bunk.new
  bunk.valid?  => true
  
  bunk.errors.add("Not bunk enough")
  bunk.errors.add("Needs moar to be bunk")
  bunk.valid? => false
  bunk.errors.formatted => "Not bunk enough -- Needs moar to be bunk"

  Example 2:
  bunk = Bunk.new
  
  bunk.errors.add("Not bunk enough")
  bunk.errors.add("Needs moar to be bunk")
  bunk.errors.formatted(Proc.new {|item| item.concat("<br />")}) => "Not bunk enough<br />Needs moar to be bunk<br />"

```

## TODOs
- optionally mixed in validator method?

## Contributing

1. Fork it ( https://github.com/[my-github-username]/common_errs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
