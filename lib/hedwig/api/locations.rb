module Hedwig
  module Api
    # Exposes convenience methods for requesting the TripAdvisor
    # location/:id, map/:lat,:long, and location_mapper/:lat,:long
    # API endpoints.
    module Locations
      include Api::Methods

      def self.find(id, options = {})
        response = Hedwig::Request.new("location/#{id}", options).get
        Hedwig::Models::Location.new(response.body)
      end

      def self.mapper(latitude, longitude, options = {})
        options = options.merge(key: Hedwig.config.api_key + '-mapper')
        path = "location_mapper/#{latitude},#{longitude}"
        request_collection(path, options)
      end
    end
  end
end
