module Hedwig
  module Values
    # Address class used in Location JSON coercion.
    class Address
      include Virtus.value_object

      values do
        attribute :street1, String
        attribute :street2, String
        attribute :city, String
        attribute :state, String
        attribute :country, String
        attribute :postalcode, String
        attribute :address_string, String
      end
    end
  end
end
