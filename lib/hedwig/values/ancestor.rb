module Hedwig
  module Values
    # Ancestor class used in Location JSON coercion.
    class Ancestor
      include Virtus.value_object

      values do
        attribute :abbrv, String
        attribute :level, String
        attribute :location_id, Integer
        attribute :name, String
      end
    end
  end
end
