module Hedwig
  module Api
    module Restaurants
      include Api::Methods

      def self.resource_name
        "restaurants"
      end
    end
  end
end
