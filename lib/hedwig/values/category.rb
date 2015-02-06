module Hedwig
  module Values
    # Category class used in Location JSON coercion.
    class Category
      include Virtus.value_object

      values do
        attribute :localized_name, String
        attribute :name, String
      end
    end
  end
end
