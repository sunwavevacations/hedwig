module Hedwig
  module Values
    # User class used in Location JSON coercion.
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
