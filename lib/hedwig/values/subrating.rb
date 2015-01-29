module Hedwig
  module Values
    class Subrating
      include Virtus.value_object

      values do
        attribute :localized_name, String
        attribute :name, String
        attribute :rating_image_url, String
        attribute :value, Float
      end
    end
  end
end
