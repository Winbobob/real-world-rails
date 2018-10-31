require 'spec_helper'

describe Locomotive::API::Resources::TokenResource do

  include Rack::Test::Methods
  let(:account) { create :account }

  context 'with email and password' do

    describe 'POST create' do
      context 'JSON' do
        before do
          post('/locomotive/api/v3/tokens.json', { email: account.email, password: 'easyone' })
        end

        subject { last_response }

        it 'responds with status 201' 


        it 'responds with the correct body' 

      end
    end

  end

end

