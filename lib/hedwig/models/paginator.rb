module Hedwig
  module Models
    class Paginator
      include Virtus.model

      attribute :next, String
      attribute :previous, String
      attribute :results, Integer
      attribute :skipped, Integer
      attribute :total_results, Integer

      alias_method :offset, :skipped
      alias_method :total, :total_results
    end
  end
end
