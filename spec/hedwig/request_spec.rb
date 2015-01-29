require 'spec_helper'

describe Hedwig::Request do

  let(:api_key) { '1234567890' }
  let(:resource) { 'location/89575' }
  let(:options) {
    {
      'lang' => 'en_US',
      'lunit' => 'mi'
    }
  }

  let(:request) { described_class.new(resource, options) }

  before do
    Hedwig.config.api_key = api_key
  end

  describe "#initialize" do
    it "assigns the resource" do
      expect(request.resource).to eq resource
    end

    it "assigns the options" do
      expect(request.options).to include options
    end

    it "adds the api key to the options" do
      expect(request.options[:key]).to eq api_key
    end
  end

  describe "#uri" do
    subject { request.uri }

    it { should be_a Addressable::URI }

    it "includes the resource path" do
      expect(subject.path).to eq resource
    end

    it "includes the options in the query string" do
      expect(subject.query_values).to include options
    end

    it "includes the api key in the query string" do
      expect(subject.query_values).to include({ 'key' => api_key })
    end
  end

  describe "#get" do
    subject { request.get }

    let(:raw_response) { double(status: 200, body: 'OK') }
    let(:response) { Hedwig::Response.new(raw_response) }

    before { allow(Hedwig.client).to receive(:get).and_return(response) }

    it "requests the uri from the client" do
      expect(Hedwig.client).to receive(:get).with(request.uri.to_s)
      subject
    end

    it "checks the response for errors" do
      expect(response).to receive(:on_error)
      subject
    end
  end

end
