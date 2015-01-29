require 'spec_helper'

describe Hedwig::Api::Restaurants do

  let(:restaurants) { described_class }

  describe ".by_location", vcr: { cassette_name: 'location-restaurants' } do
    let(:id) { 150807 }
    let(:options) { { lang: 'en_US' } }
    let(:resource) { "location/#{id}/restaurants" }

    subject { restaurants.by_location(id, options) }

    it "creates a Hedwig::Request for 'location/:id/restaurants'" do
      expect(Hedwig::Request).to receive(:new).with(resource, options).and_call_original
      subject
    end

    it "returns a Hedwig::Models::Collection" do
      expect(subject).to be_a Hedwig::Models::Collection
    end
  end

  describe ".by_coordinates", vcr: { cassette_name: 'map-restaurants' } do
    let(:latitude) { 42.33141 }
    let(:longitude) { -71.099396 }
    let(:options) { { lang: 'en_US' } }
    let(:resource) { "map/#{latitude},#{longitude}/restaurants" }

    subject { restaurants.by_coordinates(latitude, longitude, options) }

    it "creates a Hedwig::Request for 'map/:latitude,:longitude/restaurants'" do
      expect(Hedwig::Request).to receive(:new).with(resource, options).and_call_original
      subject
    end

    it "returns a Hedwig::Models::Collection" do
      expect(subject).to be_a Hedwig::Models::Collection
    end
  end

end
