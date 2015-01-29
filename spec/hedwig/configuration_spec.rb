require 'spec_helper'

describe Hedwig::Configuration do
  let(:config) { described_class.new }

  describe "#initialize" do
    context "when an api uri isn't specified" do
      it "defaults to using api version 2" do
        expect(config.api_uri).to eq 'http://api.tripadvisor.com/api/partner/2.0'
      end
    end
  end
end
