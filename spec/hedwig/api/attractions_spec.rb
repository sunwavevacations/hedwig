require 'spec_helper'

describe Hedwig::Api::Attractions do

  let(:attractions) { described_class }

  describe ".by_location", vcr: { cassette_name: 'location-attractions' } do
    let(:id) { 150807 }
    let(:options) { { lang: 'en_US' } }
    let(:resource) { "location/#{id}/attractions" }

    subject { attractions.by_location(id, options) }

    it "creates a Hedwig::Request for 'location/:id/attractions'" do
      expect(Hedwig::Request).to receive(:new).with(resource, options).and_call_original
      subject
    end

    it "returns a Hedwig::Models::Collection" do
      expect(subject).to be_a Hedwig::Models::Collection
    end

    context "when multiple ids are passed in", vcr: { cassette_name: 'multiget-attractions' } do
      let(:id) { [2226812,233835,150807] }
      let(:resource) { "location/#{id.join(',')}/attractions" }

      it "creates a multi-get request" do
        expect(Hedwig::Request).to receive(:new).with(resource, options).and_call_original
        subject
      end
    end
  end

  describe ".by_coordinates", vcr: { cassette_name: 'map-attractions' } do
    let(:latitude) { 42.33141 }
    let(:longitude) { -71.099396 }
    let(:options) { { lang: 'en_US' } }
    let(:resource) { "map/#{latitude},#{longitude}/attractions" }

    subject { attractions.by_coordinates(latitude, longitude, options) }

    it "creates a Hedwig::Request for 'map/:latitude,:longitude/attractions'" do
      expect(Hedwig::Request).to receive(:new).with(resource, options).and_call_original
      subject
    end

    it "returns a Hedwig::Models::Collection" do
      expect(subject).to be_a Hedwig::Models::Collection
    end
  end

end
