require 'spec_helper'

describe Gitlab::Middleware::BasicHealthCheck do
  let(:app) { double(:app) }
  let(:middleware) { described_class.new(app) }
  let(:env) { {} }

  describe '#call' do
    context 'outside IP' do
      before do
        env['REMOTE_ADDR'] = '8.8.8.8'
      end

      it 'returns a 404' 


      it 'forwards the call for other paths' 

    end

    context 'whitelisted IP' do
      before do
        env['REMOTE_ADDR'] = '127.0.0.1'
      end

      it 'returns 200 response when endpoint is hit' 


      it 'forwards the call for other paths' 

    end
  end
end

