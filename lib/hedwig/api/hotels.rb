module Hedwig
  module Api
    module Hotels

      def self.by_location(id, options = {})
        ids = Array(id).join(',')
        response = Hedwig::Request.new("location/#{ids}/hotels", options).get
        Hedwig::Models::Collection.new(response.body)
      end

      def self.by_coordinates(latitude, longitude, options = {})
        response = Hedwig::Request.new("map/#{latitude},#{longitude}/hotels", options).get
        Hedwig::Models::Collection.new(response.body)
      end

    end
  end
end
