require 'spec_helper'

describe Hedwig::ServiceError do

  let(:response_body) {
    {
      'error' => {
        'message' => 'invalid client key',
        'code' => '160',
        'type' => 'UnauthorizedException'
      }
    }
  }
  let(:error) { described_class.new(response_body) }

  describe "#message" do
    subject { error.message }
    it { should eq response_body['error']['message'] }
  end

  describe "#code" do
    subject { error.code }
    it { should eq response_body['error']['code'] }
  end

  describe "#type" do
    subject { error.type }
    it { should eq response_body['error']['type'] }
  end

end
