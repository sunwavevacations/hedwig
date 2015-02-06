require 'faraday'
require 'faraday_middleware'
require 'virtus'

require 'hedwig/configuration'
require 'hedwig/errors'
require 'hedwig/version'

# Main module definition
module Hedwig
  autoload :Client,   'hedwig/client'
  autoload :Response, 'hedwig/response'
  autoload :Request,  'hedwig/request'

  # Convenience methods
  module Api
    autoload :Attractions, 'hedwig/api/attractions'
    autoload :Hotels,      'hedwig/api/hotels'
    autoload :Locations,   'hedwig/api/locations'
    autoload :Methods,     'hedwig/api/methods'
    autoload :Restaurants, 'hedwig/api/restaurants'
  end

  # Main return types
  module Models
    autoload :Location,   'hedwig/models/location'
    autoload :Collection, 'hedwig/models/collection'
    autoload :Paginator,  'hedwig/models/paginator'
  end

  # Classes used for response coercion
  module Values
    autoload :Ancestor,     'hedwig/values/ancestor'
    autoload :Award,        'hedwig/values/award'
    autoload :Address,      'hedwig/values/address'
    autoload :Category,     'hedwig/values/category'
    autoload :Rank,         'hedwig/values/rank'
    autoload :Review,       'hedwig/values/review'
    autoload :Subrating,    'hedwig/values/subrating'
    autoload :TripType,     'hedwig/values/trip_type'
    autoload :User,         'hedwig/values/user'
    autoload :UserLocation, 'hedwig/values/user_location'
  end

  def self.client
    @client ||= Client.new
  end

  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield config
  end
end
