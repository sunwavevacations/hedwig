module Hedwig
  module Api
    module Restaurants

      def self.by_location(id, options = {})
        response = Hedwig::Request.new("location/#{id}/restaurants", options).get
        Hedwig::Models::Collection.new(response.body)
      end

      def self.by_coordinates(latitude, longitude, options = {})
        response = Hedwig::Request.new("map/#{latitude},#{longitude}/restaurants", options).get
        Hedwig::Models::Collection.new(response.body)
      end

    end
  end
end
