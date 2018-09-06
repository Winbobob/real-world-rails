# frozen_string_literal: true

require 'rails_helper'

describe Api::Payment::BraintreeController do
  before do
    allow(Page).to receive(:find) { page }
    allow(MobileDetector).to receive(:detect).and_return(action_mobile: 'mobile')
  end

  let(:page) do
    instance_double('Page',
                    follow_up_plan: :with_liquid,
                    follow_up_liquid_layout_id: 4,
                    slug: 'asd-f',
                    follow_up_page: nil)
  end
  let(:action) { instance_double('Action', member_id: 79) }

  describe 'GET token' do
    before do
      allow(::Braintree::ClientToken).to receive(:generate) { '1234' }

      get :token
    end

    it 'fetches token from braintree' 


    it 'renders json' 

  end

  describe 'POST transaction' do
    let(:client) { PaymentProcessor::Braintree }

    let(:params) do
      {
        payment_method_nonce: 'wqeuinv-50238-FIERN',
        amount: '40.19',
        user: { email: 'snake@hips.com', name: 'Snake Hips', action_mobile: 'mobile' },
        currency: 'NZD',
        page_id: '12'
      }
    end

    let(:payment_options) do
      {
        nonce: params[:payment_method_nonce],
        amount: params[:amount].to_f,
        user: params[:user],
        currency: params[:currency],
        page_id: params[:page_id],
        store_in_vault: false
      }
    end

    before :each do
      request.accept = 'application/json' # ask for json
    end

    describe 'successfully' do
      describe 'with recurring: true' do
        let(:builder) { instance_double('PaymentProcessor::Braintree::Subscription', action: action, success?: true, subscription_id: 's1234') }

        before do
          allow(client::Subscription).to receive(:make_subscription).and_return(builder)
          post :transaction, params: params.merge(recurring: true)
        end

        it 'calls Subscription.make_subscription' 


        it 'has status 200' 


        it 'responds with subscription_id in JSON' 


        it 'sets the member cookie' 

      end

      describe 'without recurring' do
        let(:builder) { instance_double('PaymentProcessor::Clients::Braintree::Transaction', action: action, success?: true, transaction_id: 't1234') }

        before :each do
          allow(client::Transaction).to receive(:make_transaction).and_return(builder)
          payment_options[:store_in_vault] = false
          post :transaction, params: params
        end

        it 'calls Transaction.make_transaction' 


        it 'has status 200' 


        it 'responds with transaction_id in JSON' 


        it 'sets the member cookie' 

      end
    end

    describe 'unsuccessfully' do
      let(:errors) { instance_double('PaymentProcessor::Clients::Braintree::ErrorProcessing', process: { my_error: 'foo' }) }

      before :each do
        allow(client::ErrorProcessing).to receive(:new).and_return(errors)
      end

      describe 'with recurring: true' do
        let(:builder) { instance_double('PaymentProcessor::Clients::Braintree::Subscription', success?: false, error_container: {}) }

        before do
          allow(client::Subscription).to receive(:make_subscription).and_return(builder)
          post :transaction, params: params.merge(recurring: true)
        end

        it 'calls Subscription.make_subscription' 


        it 'calls the error processor' 


        it 'has status 422' 


        it 'responds with the error messages' 


        # TODO: access to cookies.signed not working with Rails 5
        xit 'does not set the member cookie' do
          expect(cookies.signed['member_id']).to eq nil
        end
      end

      describe 'without recurring' do
        let(:builder) { instance_double('PaymentProcessor::Clients::Braintree::Transaction', success?: false, error_container: {}) }

        before :each do
          allow(client::Transaction).to receive(:make_transaction).and_return(builder)
          post :transaction, params: params
          payment_options.merge!(store_in_vault: false)
        end

        it 'calls Transaction.make_transaction' 


        it 'calls the error processor' 


        it 'has status 422' 


        it 'responds with the error messages' 


        xit 'does not set the member cookie' do
          expect(cookies.signed['member_id']).to eq nil
        end
      end
    end
  end

  describe 'POST webhook' do
    before :each do
      allow(PaymentProcessor::Braintree::WebhookHandler).to receive(:handle)
    end

    describe 'handling payload' do
      before do
        post :webhook, params: { bt_signature: 'foo', bt_payload: 'bar' }
      end

      it 'handles webhook notification' 

    end

    describe 'response' do
      context 'successful handling' do
        before do
          allow(PaymentProcessor::Braintree::WebhookHandler).to receive(:handle) { true }
          post :webhook
        end

        it 'returns OK' 

      end

      context 'unsuccessful handling' do
        before do
          allow(PaymentProcessor::Braintree::WebhookHandler).to receive(:handle) { false }
          post :webhook
        end

        it 'returns not found' 

      end
    end
  end
end

