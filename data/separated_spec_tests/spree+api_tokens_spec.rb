require 'spec_helper'
require 'spree/api/testing_support/helpers'

describe 'API Tokens Spec', type: :request do
  include Spree::Api::TestingSupport::Helpers

  shared_examples 'returns valid response' do
    it 'with 200 HTTP status' 


    it 'with all keys' 

  end

  context 'guest user' do
    context 'with already created order' do
      let(:order) { create(:order, user: nil, email: 'dummy@example.com') }

      before do
        allow_any_instance_of(Spree::StoreController).to receive_messages(current_order: order)
        get '/api_tokens'
      end

      it 'returns order token' 


      it_behaves_like 'returns valid response'
    end

    context 'without order' do
      before do
        get '/api_tokens'
      end

      it 'returns blank tokens' 


      it_behaves_like 'returns valid response'
    end
  end

  context 'signed in user' do
    let(:user) { create(:user) }

    before do
      allow_any_instance_of(Spree::StoreController).to receive_messages(try_spree_current_user: user)
    end

    context 'with already created order' do
      let(:order) { create(:order, user: user) }

      before do
        allow_any_instance_of(Spree::StoreController).to receive_messages(current_order: order)
        get '/api_tokens'
      end

      it 'returns order token and oauth token' 


      it_behaves_like 'returns valid response'
    end

    context 'without order' do
      before do
        get '/api_tokens'
      end

      it 'returns only oauth token' 


      it_behaves_like 'returns valid response'
    end
  end
end

