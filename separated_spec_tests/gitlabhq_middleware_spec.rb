require 'spec_helper'

describe Gitlab::Sherlock::Middleware do
  let(:app) { double(:app) }
  let(:middleware) { described_class.new(app) }

  describe '#call' do
    describe 'when instrumentation is enabled' do
      it 'instruments a request' 

    end

    describe 'when instrumentation is disabled' do
      it "doesn't instrument a request" 

    end
  end

  describe '#call_with_instrumentation' do
    it 'instruments a request' 

  end

  describe '#instrument?' do
    it 'returns false for a text/css request' 


    it 'returns false for a request to a Sherlock route' 


    it 'returns true for a request that should be instrumented' 

  end

  describe '#transaction_from_env' do
    it 'returns a Transaction' 

  end
end

