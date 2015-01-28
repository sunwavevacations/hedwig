module Hedwig
  class Configuration
    attr_accessor :api_key, :api_uri

    def initialize(options = {})
      @api_key = options[:api_key]
      @api_uri = options.fetch(:api_uri, 'http://api.tripadvisor.com/api/partner/2.0')
    end
  end
end