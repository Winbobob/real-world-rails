require 'spec_helper'

describe ActiveResource::ConnectionError do

  subject { described_class.new(nil) }

  it { should respond_to :message }

  describe '#initialize' do

    context 'when response body is JSON-parseable' do
      let(:response) do
        double(:response, body: '{"message":"oops"}')
      end

      it 'extracts the message attr from the body' 

    end

    context 'when response body is not JSON-parseable' do
      let(:response) do
        double(:response, body: 'oops')
      end

      it 'sets the message attr from the message arg' 

    end
  end
end

