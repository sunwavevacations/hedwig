module Hedwig
  module Models
    # Most TripAdvisor calls return multiple Locations. This class coerces the
    # JSON data returned into an object that quacks like an Array of Location
    # instances. It also houses the pagination data returned by the API.
    #
    # TODO: Add more convenient pagination methods for accessing next/previous
    # groups of Locations from the API.
    class Collection
      include Enumerable
      include Virtus.model
      extend Forwardable

      delegate each: :data

      attribute :data, Array[Models::Location]
      attribute :paging, Models::Paginator
    end
  end
end
