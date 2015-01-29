require 'addressable/uri'

module Hedwig
  class Request

    attr_reader :resource, :options

    def initialize(resource, options = {})
      @resource = resource
      @options = defaults.merge(options)
    end

    def uri
      Addressable::URI.new(path: resource, query_values: options)
    end

    def get
      response = client.get(uri.to_s)
      response.on_error(&:raise_errors)
    end

    private

    def client
      Hedwig.client
    end

    def defaults
      {
        key: Hedwig.config.api_key
      }
    end

  end
end
