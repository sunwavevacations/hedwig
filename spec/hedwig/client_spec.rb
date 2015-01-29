require 'spec_helper'

describe Hedwig::Client do

  let(:client) { described_class.new }

  describe "#connection" do
    subject { client.connection }

    it { should be_a Faraday::Connection }

    it "uses the api_uri configuration parameter" do
      expect(subject.url_prefix.to_s).to eq Hedwig.config.api_uri
    end
  end

  describe "#get" do
    let(:uri) { 'http://example.com' }
    let(:response) { double(status: 200, body: 'OK') }

    before { allow(client.connection).to receive(:get).with(uri).and_return(response) }

    subject { client.get(uri) }

    it "creates a Faraday GET request" do
      expect(client.connection).to receive(:get).with(uri).and_return(response)
      subject
    end

    it "returns an Hedwig::Response object" do
      expect(subject).to be_a Hedwig::Response
    end
  end

end
