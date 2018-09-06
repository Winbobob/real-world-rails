require 'spec_helper'

describe Gitlab::Metrics::RackMiddleware do
  let(:app) { double(:app) }

  let(:middleware) { described_class.new(app) }

  let(:env) { { 'REQUEST_METHOD' => 'GET', 'REQUEST_URI' => '/foo' } }

  describe '#call' do
    before do
      expect_any_instance_of(Gitlab::Metrics::Transaction).to receive(:finish)
    end

    it 'tracks a transaction' 


    it 'tracks any raised exceptions' 

  end

  describe '#transaction_from_env' do
    let(:transaction) { middleware.transaction_from_env(env) }

    it 'returns a Transaction' 


    it 'stores the request method and URI in the transaction as values' 


    context "when URI includes sensitive parameters" do
      let(:env) do
        {
          'REQUEST_METHOD' => 'GET',
          'REQUEST_URI'    => '/foo?private_token=my-token',
          'PATH_INFO' => '/foo',
          'QUERY_STRING' => 'private_token=my_token',
          'action_dispatch.parameter_filter' => [:private_token]
        }
      end

      it 'stores the request URI with the sensitive parameters filtered' 

    end
  end
end

