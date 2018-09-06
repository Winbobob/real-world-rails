# frozen_string_literal: true

require 'rails_helper'

describe Api::GoCardlessController do
  let(:page) do
    double(:page,
           id: 1,
           slug: 'trol-lol-lol',
           follow_up_plan: :with_liquid,
           follow_up_liquid_layout_id: 4,
           follow_up_page: nil)
  end
  let(:action) { instance_double('Action', member_id: 79) }

  before do
    allow(Page).to receive(:find) { page }
    allow(SecureRandom).to receive(:uuid) { 'fake_session_id' }
    allow(MobileDetector).to receive(:detect) { { action_mobile: 'tablet' } }
  end

  describe 'GET #start_flow' do
    let(:director) { double(:director, success?: true, redirect_url: 'http://example.com/redirect_url') }

    before do
      allow(GoCardlessDirector).to receive(:new) { director }

      subject
    end

    subject { get :start_flow, params: { page_id: '1', foo: 'bar' } }

    it 'instantiates GoCardlessDirector' 


    it 'redirects' 

  end

  describe 'POST transaction' do
    let(:client) { PaymentProcessor::GoCardless }

    let(:params) do
      {
        amount: '40.19',
        user: { email: 'snake@hips.com', name: 'Snake Hips', action_mobile: 'tablet' },
        currency: 'EUR',
        page_id: '12',
        redirect_flow_id: 'RE2109123',
        session_token: '4f592f2a-2bc2-4028-8a8c-19b222e2faa7'
      }
    end

    let(:payment_options) do
      {
        amount: params[:amount],
        currency: params[:currency],
        user: params[:user],
        page_id: params[:page_id],
        redirect_flow_id: params[:redirect_flow_id],
        session_token: request.session[:go_cardless_session_id]
      }
    end

    describe 'successfully' do
      shared_examples 'success tasks' do
        it 'has status 302' 


        it 'responds by redirecting to the follow up page' 


        it 'sets the member cookie' 

      end

      describe 'with recurring: true' do
        let(:builder) { instance_double('PaymentProcessor::GoCardless::Subscription', action: action, success?: true, subscription_id: 'SU243980') }

        before do
          allow(client::Subscription).to receive(:make_subscription).and_return(builder)
          post :transaction, params: params.merge(recurring: true)
        end

        it 'calls Subscription.make_subscription' 


        include_examples 'success tasks'
      end

      describe 'without recurring' do
        let(:builder) { instance_double('PaymentProcessor::GoCardless::Transaction', action: action, success?: true, transaction_id: 'PA235890') }

        before :each do
          allow(client::Transaction).to receive(:make_transaction).and_return(builder)
          post :transaction, params: params
        end

        it 'calls Transaction.make_transaction' 


        include_examples 'success tasks'
      end
    end

    describe 'unsuccessfully' do
      let(:errors) { instance_double('PaymentProcessor::GoCardless::ErrorProcessing', process: [{ my_error: 'foo' }]) }

      before :each do
        allow(client::ErrorProcessing).to receive(:new).and_return(errors)
      end

      shared_examples 'failure tasks' do
        it 'calls the error processor' 


        it 'has status 200' 


        it 'renders payment/donation_errors' 


        it 'assigns @page and @errors' 


        it 'does not set the member cookie' 

      end

      describe 'with recurring: true' do
        let(:builder) { instance_double('PaymentProcessor::GoCardless::Subscription', success?: false, error_container: {}) }

        before do
          allow(client::Subscription).to receive(:make_subscription).and_return(builder)
          post :transaction, params: params.merge(recurring: true)
        end

        it 'calls Subscription.make_subscription' 


        include_examples 'failure tasks'
      end

      describe 'without recurring' do
        let(:transaction) { instance_double('Braintree::Transaction', id: 't1234') }
        let(:builder) { instance_double('PaymentProcessor::GoCardless::Transaction', success?: false, error_container: {}) }

        before :each do
          allow(client::Transaction).to receive(:make_transaction).and_return(builder)
          post :transaction, params: params
        end

        it 'calls Transaction.make_transaction' 


        include_examples 'failure tasks'
      end
    end
  end

  describe 'POST #webhook' do
    let(:validator) { double(valid?: true) }

    before do
      allow(Api::HMACSignatureValidator).to receive(:new) { validator }
      allow(PaymentProcessor::GoCardless::WebhookHandler::ProcessEvents).to receive(:process)
    end

    it 'instantiates signature validator' 


    context 'with invalid events' do
      before do
        allow(validator).to receive(:valid?) { false }
        post 'webhook'
      end

      it 'does not process events' 


      it 'returns 427' 

    end

    context 'with valid events' do
      before do
        allow(validator).to receive(:valid?) { true }
        post 'webhook', params: { events: {} }
      end

      it 'processes events' 


      it 'returns 200 ok' 

    end
  end
end

