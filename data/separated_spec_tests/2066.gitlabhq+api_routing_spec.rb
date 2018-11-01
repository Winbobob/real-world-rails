require 'spec_helper'

describe 'api', 'routing' do
  context 'when graphql is disabled' do
    before do
      stub_feature_flags(graphql: false)
    end

    it 'does not route to the GraphqlController' 


    it 'does not expose graphiql' 

  end

  context 'when graphql is disabled' do
    before do
      stub_feature_flags(graphql: true)
    end

    it 'routes to the GraphqlController' 


    it 'exposes graphiql' 

  end
end

