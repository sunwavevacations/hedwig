module Hedwig
  module Models
    class Location
      include Virtus.model

      # All locations
      attribute :address_obj, Values::Address
      attribute :ancestors, Array[Values::Ancestor]
      attribute :awards, Array[Values::Award]
      attribute :category, Values::Category
      attribute :latitude, Float
      attribute :location_id, Integer
      attribute :location_string, String
      attribute :longitude, Float
      attribute :name, String
      attribute :see_all_photos, String
      attribute :subcategory, Array[Values::Category]
      attribute :web_url, String

      # Mapped locations
      attribute :bearing, String
      attribute :distance, Float

      # Cities, States, Countries
      attribute :abbrv, String
      attribute :category_counts, Hash
      attribute :geo_type, String
      attribute :see_all_attractions, String
      attribute :see_all_hotels, String
      attribute :see_all_restaurants, String

      # Attractions, Hotels, Restaurants
      attribute :attraction_types, Array[Values::Category]
      attribute :api_detail_url, String
      attribute :num_reviews, Integer
      attribute :percent_recommended, Integer
      attribute :photo_count, Integer
      attribute :price_level, String
      attribute :ranking_data, Values::Rank
      attribute :rating, Float
      attribute :rating_image_url, String
      attribute :review_rating_count, Hash
      attribute :reviews, Array[Values::Review]
      attribute :subratings, Array[Values::Subrating]
      attribute :trip_types, Array[Values::TripType]
      attribute :wikipedia_info, String
      attribute :write_review, String

      alias_method :id, :location_id
      alias_method :address, :address_obj
      alias_method :rank, :ranking_data

      def attractions(options = {})
        @attrations ||= Api::Attractions.by_location(id, options)
      end

      def hotels(options = {})
        @hotels ||= Api::Hotels.by_location(id, options)
      end

      def restaurants(options = {})
        @restaurants ||= Api::Restaurants.by_location(id, options)
      end

    end
  end
end
