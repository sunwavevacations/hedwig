module Hedwig
  module Api
    module Methods
      def self.included(klass)
        klass.extend ClassMethods
      end

      module ClassMethods

        def resource_name
        end

        def by_location(id, options = {})
          ids = Array(id).join(',')
          path = ['location', ids, resource_name].compact.join('/')
          request_collection(path, options)
        end

        def by_coordinates(latitude, longitude, options = {})
          path = ['map', "#{latitude},#{longitude}", resource_name].compact.join('/')
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
