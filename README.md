# Hedwig

[![Build Status](https://travis-ci.org/jaredhoyt/hedwig.svg)](https://travis-ci.org/jaredhoyt/hedwig)
[![Dependency Status](https://gemnasium.com/jaredhoyt/hedwig.svg)](https://gemnasium.com/jaredhoyt/hedwig)
[![Code Climate](https://codeclimate.com/github/jaredhoyt/hedwig/badges/gpa.svg)](https://codeclimate.com/github/jaredhoyt/hedwig)
[![Test Coverage](https://codeclimate.com/github/jaredhoyt/hedwig/badges/coverage.svg)](https://codeclimate.com/github/jaredhoyt/hedwig)

Hedwig is an API wrapper for [TripAdvisor's Content API](https://developer-tripadvisor.com/content-api/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hedwig'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hedwig

## Configuration

You can configure your API key by adding this to the initialization of your application:

```ruby
Hedwig.configure do |config|
  config.api_key = '8a93ka...'
end
```

or

```ruby
Hedwig.config.api_key = '8a93ka...'
```

## Usage

There are 2 types of models returned by Hedwig API calls: [Location](lib/hedwig/models/location.rb) and [Collection](lib/hedwig/models/collection.rb).
`Collection`s quack like an array of `Location`s with some additional pagination methods mixed in.

Although TripAdvisor has specific calls for attractions, hotels, and restaurants, they really only return different versions of a `Location`. Each location
contains a [Category](lib/hedwig/values/category.rb) that describes the type of `Location` returned. 

### Find a Location


### Find Attractions, Hotels, and Restaurants

## Contributing

1. Fork it ( https://github.com/jaredhoyt/hedwig/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
