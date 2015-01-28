require 'spec_helper'

describe Hedwig::Configuration do
  subject { described_class.new }

  describe "#initialize" do
    context "when an api uri isn't specified" do
      it "defaults to using api version 2" do
        expect(subject.api_uri).to eq 'http://api.tripadvisor.com/api/partner/2.0'
      end
    end
  end
end
