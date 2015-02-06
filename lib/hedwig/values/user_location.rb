module Hedwig
  module Values
    # UserLocation class used in Location JSON coercion.
    class UserLocation
      include Virtus.value_object

      values do
        attribute :id, Integer
        attribute :name, String
      end
    end
  end
end
