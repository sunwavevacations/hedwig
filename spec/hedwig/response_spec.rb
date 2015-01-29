require 'spec_helper'

describe Hedwig::Response do

  let(:raw_response) { double(status: 200, body: 'OK') }
  let(:response) { described_class.new(raw_response) }

  describe "#initialize" do
    it "assigns the raw_response" do
      expect(response.raw_response).to eq raw_response
    end
  end

  describe "#status" do
    it "delegates to the raw response" do
      expect(response.status).to eq raw_response.status
    end
  end

  describe "#body" do
    it "delegates to the raw response" do
      expect(response.body).to eq raw_response.body
    end
  end

  describe "#success?" do
    subject { response.success? }

    context "when the status is 200 through 299" do
      it { should be true }
    end

    context "when the status is anything else" do
      let(:raw_response) { double(status: 401) }
      it { should be false }
    end
  end

  describe "#on_error" do
    subject { response.on_error }

    it "returns self" do
      expect(subject).to eq response
    end

    context "when request is a success" do
      it "does nothing" do
        expect { |b| response.on_error(&b) }.not_to yield_control
      end
    end

    context "when request has an error" do
      it "yields to the associated block" do
        allow(response).to receive(:success?).and_return(false)
        expect { |b| response.on_error(&b) }.to yield_control
      end
    end
  end

  describe '#raise_errors' do
    subject { response.raise_errors }

    let(:raw_response) { double(status: status, body: { error: '' }) }

    context 'when the status is 401' do
      let(:status) { 401 }
      it 'raises an AccessDenied error' do
        expect{ subject }.to raise_error(Hedwig::AccessDenied)
      end
    end

    context 'when the status is 404' do
      let(:status) { 404 }
      it 'raises a ResourceNotFound error' do
        expect{ subject }.to raise_error(Hedwig::ResourceNotFound)
      end
    end

    context 'when the status is 400 through 499' do
      let(:status) { 402 }
      it 'raises a ServiceError' do
        expect{ subject }.to raise_error(Hedwig::ServiceError)
      end
    end

    context 'when the status is 500 through 599' do
      let(:status) { 555 }
      it 'raises a ServerError' do
        expect{ subject }.to raise_error(Hedwig::ServerError)
      end
    end
  end

end
