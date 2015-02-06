module Hedwig
  module Api
    # Exposes convenience methods for requesting the TripAdvisor
    # location/:id/attractions and map/:lat,:long/attractions API endpoints.
    module Attractions
      include Api::Methods

      def self.resource_name
        'attractions'
      end
    end
  end
end
