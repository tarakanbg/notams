# Notams

A ruby gem for retrieving the currently active NOTAMs for an airport or a region.
Supports multiple airports/regions in one request. Pulls data from [FAA](http://www.faa.gov/) website.
Depends on `nokogiri` for the heavy lifting.

## Installation

Add this line to your application's Gemfile:

    gem 'notams'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install notams

## Usage

The `.notams` method can be applied to any string (or variable containing a string), representing a valid
ICAO code of an airport or FIR, or a comma-separated list of airports/regions. It will return an array,
containing all the **currently active** NOTAMs for your selection. You can loop through the array to display or
parse individual notams.

```ruby
icao = "lowi"
icao.notams # => returns an array containing all NOTAMs for London Heathrow

"lowi".notams # => same as above

icao = "lqsa,lqsb"
icao.notams # => returns an array containing all NOTAMs for Sarajevo Airport and Bosnia and Herzegovina FIR
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
