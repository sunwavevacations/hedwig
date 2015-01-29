module Hedwig
  module Values
    class Review
      include Virtus.value_object

      values do
        attribute :id, Integer
        attribute :lang, String
        attribute :location_id, Integer
        attribute :published_date, DateTime
        attribute :rating, Integer
        attribute :helpful_votes, Integer
        attribute :rating_image_url, String
        attribute :url, String
        attribute :text, String
        attribute :title, String
        attribute :is_machine_translated, Boolean
        attribute :user, Values::User
      end

      alias_method :is_machine_translated?, :is_machine_translated
    end
  end
end
