require 'spec_helper'

describe Hedwig::Api::Locations do

  let(:locations) { described_class }

  describe ".find", vcr: { cassette_name: 'location' } do
    let(:id) { 89575 }
    let(:options) { { lang: 'en_US' } }
    let(:resource) { "location/#{id}" }

    subject { locations.find(id, options) }

    it "creates a Hedwig::Request for 'location/:id'" do
      expect(Hedwig::Request).to receive(:new).with(resource, options).and_call_original
      subject
    end

    it "returns a Hedwig::Models::Location" do
      expect(subject).to be_a Hedwig::Models::Location
    end
  end

  describe ".by_coordinates", vcr: { cassette_name: 'map' } do
    let(:latitude) { 42.33141 }
    let(:longitude) { -71.099396 }
    let(:options) { { lang: 'en_US' } }
    let(:resource) { "map/#{latitude},#{longitude}" }

    subject { locations.by_coordinates(latitude, longitude, options) }

    it "creates a Hedwig::Request for 'map/:latitude,:longitude'" do
      expect(Hedwig::Request).to receive(:new).with(resource, options).and_call_original
      subject
    end

    it "returns a Hedwig::Models::Collection" do
      expect(subject).to be_a Hedwig::Models::Collection
    end
  end

  describe ".mapper", vcr: { cassette_name: 'locations-mapper' } do
    let(:latitude) { 42.33141 }
    let(:longitude) { -71.099396 }
    let(:options) { { lang: 'en_US' } }
    let(:merged_options) { options.merge({ key: Hedwig.config.api_key + '-mapper' }) }
    let(:resource) { "location_mapper/#{latitude},#{longitude}" }

    subject { locations.mapper(latitude, longitude, options) }

    it "creates a Hedwig::Request for 'location_mapper/:latitude,:longitude?key=<api-key>-mapper'" do
      expect(Hedwig::Request).to receive(:new).with(resource, merged_options).and_call_original
      subject
    end
  end

end
