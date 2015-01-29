module Hedwig
  module Values
    class Award
      include Virtus.value_object

      values do
        attribute :award_type, String
        attribute :categories, Array[String]
        attribute :display_name, String
        attribute :images, Hash
        attribute :year, String
      end
    end
  end
end
