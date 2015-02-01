module Hedwig
  module Api
    module Hotels
      include Api::Methods

      def self.resource_name
        "hotels"
      end
    end
  end
end
