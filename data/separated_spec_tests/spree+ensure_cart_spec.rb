require 'spec_helper'
require 'spree/api/testing_support/helpers'

describe 'Ensure Cart Spec', type: :request do
  include Spree::Api::TestingSupport::Helpers

  let(:exec_post) { post '/ensure_cart' }

  shared_examples 'returns current order' do
    it 'with 200 HTTP status' 


    it 'returns order' 

  end

  shared_examples 'creates new order' do
    it 'and returns it' 

  end

  context 'guest user' do
    context 'with already created order' do
      let(:order) { create(:order, user: nil, email: 'dummy@example.com') }

      before do
        allow_any_instance_of(Spree::StoreController).to receive_messages(current_order: order)
        exec_post
      end

      it_behaves_like 'returns current order'
    end

    context 'without order' do
      it_behaves_like 'creates new order'
    end
  end

  context 'signed in user' do
    let(:user) { create(:user) }

    context 'with already created order' do
      let(:order) { create(:order, user: user, email: 'dummy@example.com') }

      before do
        allow_any_instance_of(Spree::StoreController).to receive_messages(current_order: order)
        exec_post
      end

      it_behaves_like 'returns current order'
    end

    context 'without order' do
      it_behaves_like 'creates new order'
    end
  end
end

