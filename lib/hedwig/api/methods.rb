module Hedwig
  module Api
    # Abstracted methods for accessing TripAdvisor points of interest
    # with a location id or with a latitude/longitude combination.
    #
    # Classes that include this module need to define resource_name to
    # set up proper API calls.
    module Methods
      def self.included(klass)
        klass.extend ClassMethods
      end

      # Class methods available when included.
      module ClassMethods
        def resource_name; end

        def by_location(id, options = {})
          ids = Array(id).join(',')
          path = ['location', ids, resource_name].compact.join('/')
          request_collection(path, options)
        end

        def by_coordinates(latitude, longitude, options = {})
          path = ['map', "#{latitude},#{longitude}", resource_name]
          path = path.compact.join('/')
          request_collection(path, options)
        end

        private

        def request_collection(path, options)
          response = Hedwig::Request.new(path, options).get
          Hedwig::Models::Collection.new(response.body)
        end
      end
    end
  end
end
