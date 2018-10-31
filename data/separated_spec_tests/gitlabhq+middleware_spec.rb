require 'spec_helper'

describe Gitlab::QueryLimiting::Middleware do
  describe '#call' do
    it 'runs the application with query limiting in place' 

  end

  describe '#action_name' do
    let(:middleware) { described_class.new(-> (env) { env }) }

    context 'using a Rails request' do
      it 'returns the name of the controller and action' 


      it 'includes the content type if this is not text/html' 

    end

    context 'using a Grape API request' do
      it 'returns the name of the request method and endpoint path' 


      it 'returns nil if the route can not be retrieved' 

    end
  end
end

