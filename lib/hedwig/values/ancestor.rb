module Hedwig
  module Values
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
