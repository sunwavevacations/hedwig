module Hedwig
  module Values
    class User
      include Virtus.value_object

      values do
        attribute :username, String
        attribute :user_location, Values::UserLocation
      end

      alias_method :location, :user_location
    end
  end
end
