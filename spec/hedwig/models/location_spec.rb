require 'spec_helper'

describe Hedwig::Models::Location do

  let(:id) { 150807 }
  let(:options) { { lang: 'en_US' } }
  let(:location) { described_class.new(location_id: id) }

  describe "#attractions", vcr: { cassette_name: 'location-attractions' } do
    it "returns a Hedwig::Models::Collection" do
      expect(location.attractions(options)).to be_a Hedwig::Models::Collection
    end
  end

  describe "#hotels", vcr: { cassette_name: 'location-hotels' } do
    it "returns a Hedwig::Models::Collection" do
      expect(location.hotels(options)).to be_a Hedwig::Models::Collection
    end
  end

  describe "#restaurants", vcr: { cassette_name: 'location-restaurants' } do
    it "returns a Hedwig::Models::Collection" do
      expect(location.restaurants(options)).to be_a Hedwig::Models::Collection
    end
  end

end
