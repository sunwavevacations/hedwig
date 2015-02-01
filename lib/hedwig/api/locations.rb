module Hedwig
  module Api
    module Locations

      def self.find(id, options = {})
        response = Hedwig::Request.new("location/#{id}", options).get
        Hedwig::Models::Location.new(response.body)
      end

      def self.by_coordinates(latitude, longitude, options = {})
        response = Hedwig::Request.new("map/#{latitude},#{longitude}", options).get
        Hedwig::Models::Collection.new(response.body)
      end

      def self.mapper(latitude, longitude, options = {})
        options = options.merge({ key: Hedwig.config.api_key + '-mapper' })
        response = Hedwig::Request.new("location_mapper/#{latitude},#{longitude}", options).get
        Hedwig::Models::Collection.new(response.body)
      end

    end
  end
end
