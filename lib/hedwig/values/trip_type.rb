module Hedwig
  module Values
    class TripType
      include Virtus.value_object

      values do
        attribute :localized_name, String
        attribute :name, String
        attribute :value, Integer
      end
    end
  end
end
