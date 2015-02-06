module Hedwig
  # Application-wide configuration for Hedwig. See lib/hedwig.rb for usage.
  class Configuration
    attr_accessor :api_key, :api_uri

    def initialize(options = {})
      self.api_key = options[:api_key]
      self.api_uri = options.fetch(:api_uri, 'http://api.tripadvisor.com/api/partner/2.0')
    end
  end
end
