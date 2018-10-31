# frozen_string_literal: true

require 'rails_helper'

describe 'Braintree API' do
  let(:page) { create(:page, title: 'Cash rules everything around me') }
  let(:form) { create(:form) }
  let(:four_digits) { /[0-9]{4}/ }
  let(:token_format) { /[a-z0-9]{1,36}/i }
  let(:user_params) do
    {
      form_id: form.id,
      name: 'Bernie Sanders',
      email: 'itsme@feelthebern.org',
      postal: '11225',
      address1: '25 Elm Drive',
      akid: '1234.5678.9910',
      source: 'fb',
      country: 'US'
    }
  end

  let(:setup_params) do
    {
      currency: 'EUR',
      payment_method_nonce: 'fake-valid-nonce',
      recurring: true,
      user: user_params
    }
  end

  before :each do
    allow(ChampaignQueue).to receive(:push)
    allow(Analytics::Page).to receive(:increment)
  end

  shared_examples 'has no unintended consequences' do
    it 'does not create an Action' 


    it 'does not modify the Member' 


    it 'does not modify the Payment::Braintree::Subscription' 


    it 'does not modify the Payment::Braintree::Customer' 


    it 'returns 200' 

  end

  describe 'receiving a webhook' do
    describe 'of a subscription charge' do
      let(:subscription) { Payment::Braintree::Subscription.last }

      let(:notification) do
        Braintree::WebhookTesting.sample_notification(
          Braintree::WebhookNotification::Kind::SubscriptionChargedSuccessfully,
          Payment::Braintree::Subscription.last.subscription_id
        )
      end

      subject { post api_payment_braintree_webhook_path, params: notification }

      describe 'for a credit card' do
        let(:amount) { 813.20 }
        let(:params) { setup_params.merge(payment_method_nonce: 'fake-valid-nonce', amount: amount) }

        before :each do
          # rather than set up a fake testing environment, let the success test set it up for us
          VCR.use_cassette('subscription success basic new customer') do
            post api_payment_braintree_transaction_path(page.id), params: params
          end

          @subscription = Payment::Braintree::Subscription.last
        end

        it 'creates a Payment::Braintree::Transaction that is associated with a page' 


        it 'pushes to the queue with the right params' 


        it 'creates transaction on subscription' 


        include_examples 'has no unintended consequences'

        context 'missing subscription' do
          let(:notification) do
            Braintree::WebhookTesting.sample_notification(
              Braintree::WebhookNotification::Kind::SubscriptionChargedSuccessfully, 'xxx'
            )
          end

          # We're failing silently if the subscription isn't persisted locally because we get a lot of webhooks
          # for subscriptions that were created on our legacy platform.
          it 'fails silently on a missing subscription' 


          it 'does not create a transaction' 

        end
      end

      describe 'for paypal' do
        let(:amount) { 819.20 } # to avoid duplicate donations recording specs
        let(:params) { setup_params.merge(user: user_params, payment_method_nonce: 'fake-paypal-future-nonce', amount: amount) }

        before :each do
          VCR.use_cassette('subscription success paypal new customer') do
            post api_payment_braintree_transaction_path(page.id), params: params
          end
        end

        it 'creates a Payment::Braintree::Transaction associated with a page' 


        it 'pushes to the queue with the right params' 


        it 'does not create an action' 


        include_examples 'has no unintended consequences'
      end
    end

    describe 'of a subscription cancellation' do
      let!(:page) { create(:page, language: create(:language, :english)) }
      let!(:member) { create(:member, email: 'test@example.com') }
      let!(:customer) { create(:payment_braintree_customer, member: member) }
      let!(:subscription) do
        create(:payment_braintree_subscription,
               customer: customer,
               subscription_id: 'subscription_id',
               action: create(:action, member: member, page: page))
      end

      let(:notification) do
        Braintree::WebhookTesting.sample_notification(
          Braintree::WebhookNotification::Kind::SubscriptionCanceled,
          subscription.subscription_id
        )
      end

      subject { post api_payment_braintree_webhook_path, params: notification }

      context 'subscription does not exist' do
        let!(:subscription) { double(:fake_subscription, subscription_id: 'xx') }

        it 'does nothing' 

      end

      context 'for a subscription that is marked active' do
        describe 'for a credit card' do
          let(:amount) { 813.20 }
          let(:params) { setup_params.merge(payment_method_nonce: 'fake-valid-nonce', amount: amount) }

          before :each do
            VCR.use_cassette('subscription success basic new customer') do
              post api_payment_braintree_transaction_path(page.id), params: params
            end
          end

          it 'posts a cancellation event to the ChampaignQueue' 


          it 'sets cancelled_at on subscription record' 


          it 'does not create a transaction' 


          include_examples 'has no unintended consequences'
        end
      end

      context 'for a subscription already marked cancelled' do
        let(:subscription) { create :payment_braintree_subscription, cancelled_at: Time.now, subscription_id: 'asdf' }

        let(:notification) do
          Braintree::WebhookTesting.sample_notification(
            Braintree::WebhookNotification::Kind::SubscriptionCanceled,
            subscription.subscription_id
          )
        end

        it 'does not publish an unsubscribe event' 

      end
    end
  end
end

