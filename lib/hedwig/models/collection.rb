module Hedwig
  module Models
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
