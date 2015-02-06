module Hedwig
  module Api
    # Exposes convenience methods for requesting the TripAdvisor
    # location/:id/restaurants and map/:lat,:long/restaurants API endpoints.
    module Restaurants
      include Api::Methods

      def self.resource_name
        'restaurants'
      end
    end
  end
end
