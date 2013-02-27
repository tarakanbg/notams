# Notams

A ruby gem for retrieving the currently active NOTAMs for an airport or a region.
Supports multiple airports/regions in one request. Pulls data from
[FAA](http://www.faa.gov/) website. Depends on `nokogiri` for the heavy lifting.

[![Build Status](https://secure.travis-ci.org/tarakanbg/notams.png?branch=master)](http://travis-ci.org/tarakanbg/notams)
[![Gemnasium](https://gemnasium.com/tarakanbg/notams.png?travis)](https://gemnasium.com/tarakanbg/notams)
[![Gem Version](https://badge.fury.io/rb/notams.png)](http://badge.fury.io/rb/notams)
[![Code Climate](https://codeclimate.com/github/tarakanbg/notams.png)](https://codeclimate.com/github/tarakanbg/notams)

## Requirements

[Ruby 1.9.3](http://www.ruby-lang.org/en/downloads/) or higher | **Supports Ruby 2.0!**


## Installation

Add this line to your application's Gemfile:

    gem 'notams'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install notams

## Usage

### Easy mode

The `.notams` method can be applied to any string literal or variable,
representing a valid ICAO code of an airport or FIR, or a comma-separated list
of airports/regions. It will return an array, containing all the **currently
active** NOTAMs for your selection. You can loop through the array to display or
parse individual notams. I figured this would be the most common use case. For
advanced usage and possible customizations [see below](#advanced-usage).

```ruby
icao = "lowi"
icao.notams # => returns an array containing all NOTAMs for Innsbruck airport

"lowi".notams # => same as above

icao = "lqsa,lqsb"
icao.notams # => returns an array containing all NOTAMs for Sarajevo Airport
            #    and Bosnia and Herzegovina FIR
```

### Advanced usage

The `.notams` method can be customized by passing an optional hash of arguments.

The `:objects => true` option will cause the `.notams` method to return an array
of notam **objects** instead of strings. Thus each notam is parsed and
encapuslated in an instance of the `Notam` class and exposes a number of
**attributes**:

```ruby
icao = "lqsa"
icao.notams(:objects => true) # => returns an array of notam objects

notam = icao.notams.first # => returns the first notam as an object

# Notam object attributes

notam.raw       # => returns the raw (unprocessed) notam as a string
notam.icao      # => returns the icao code of the airport or area, covered by the notam;
                #    useful when iterating over multiple notams, covering a collection of airports or areas
notam.message   # => returns the actual information message of the notam as a string
```

### Example Ruby on Rails implementation

Here's a possible scenario of using this gem in a Ruby on Rails application.
Verbosity is kept on purpose for clarity.

**In your controller:**
```ruby
def action

 # We define the airpots and/or areas that we're interested in.
 # In this case this is Sarajevo Airport and the entire Bosnia & Herzegovina FIR

 icao = "lqsa, lqsb"

 # Now we want to pull all the latest notams for both these areas.
 # We also want to pull them as objects, so that we can process their attributes
 # separately in our views. We're assigning the result to the @notams instance
 # variable which we will use in our views

 @notams = icao.notams(:objects => true)

end
```

**In your view (HAML is used for clarity):**

```haml
// We could play with the attributes individually if we need to:
- for notam in @notams
  %li
   = notam.icao
   = notam.message

// Or we could just loop through the raw notams:
- for notam in @notams
  %li= notam.raw
```

## Changelog

### v. 0.2.0 27 February 2013

* Ruby 2.0 support
* dependencies update
* classes refactored

### v. 0.1.0 28 July 2012

* added optional arguments customization to the `.notams` method (see [Advanced Usage](#advanced-usage))
* code refactored into classes for flexibility


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Make sure all tests pass!
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request


## Credits

Copyright © 2013 [Svilen Vassilev](http://svilen.rubystudio.net)

*If you find my work useful or time-saving, you can endorse it or buy me a cup of coffee:*

[![endorse](http://api.coderwall.com/svilenv/endorsecount.png)](http://coderwall.com/svilenv)
[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5FR7AQA4PLD8A)

Released under the [MIT LICENSE](https://github.com/tarakanbg/notams/blob/master/LICENSE)
