module Hedwig
  module Values
    class UserLocation
      include Virtus.value_object

      values do
        attribute :id, Integer
        attribute :name, String
      end
    end
  end
end
