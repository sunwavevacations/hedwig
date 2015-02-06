module Hedwig
  module Api
    # Exposes convenience methods for requesting the TripAdvisor
    # location/:id/hotels and map/:lat,:long/hotels API endpoints.
    module Hotels
      include Api::Methods

      def self.resource_name
        'hotels'
      end
    end
  end
end
