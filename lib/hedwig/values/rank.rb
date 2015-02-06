module Hedwig
  module Values
    # Rank class used in Location JSON coercion.
    class Rank
      include Virtus.value_object

      values do
        attribute :geo_location_id, Integer
        attribute :geo_location_name, String
        attribute :ranking, Integer
        attribute :ranking_out_of, Integer
        attribute :ranking_string, String
      end
    end
  end
end
