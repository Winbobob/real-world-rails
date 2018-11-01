require 'spec_helper'

describe Gitlab::Middleware::RailsQueueDuration do
  let(:app) { double(:app) }
  let(:middleware) { described_class.new(app) }
  let(:env) { {} }
  let(:transaction) { Gitlab::Metrics::WebTransaction.new(env) }

  before do
    expect(app).to receive(:call).with(env).and_return('yay')
  end

  describe '#call' do
    it 'calls the app when metrics are disabled' 


    context 'when metrics are enabled' do
      before do
        allow(Gitlab::Metrics).to receive(:current_transaction).and_return(transaction)
      end

      it 'calls the app when metrics are enabled but no timing header is found' 


      it 'sets proxy_flight_time and calls the app when the header is present' 


      it 'observes rails queue duration metrics and calls the app when the header is present' 

    end
  end
end

