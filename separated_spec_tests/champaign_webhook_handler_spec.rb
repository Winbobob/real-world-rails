# frozen_string_literal: true

require 'rails_helper'

describe PaymentProcessor::Braintree::WebhookHandler do
  def notification_faker(type, object_id)
    Braintree::WebhookTesting.sample_notification(
      type,
      object_id
    )
  end

  let(:member)       { create(:member) }
  let(:action)       { create(:action, member: member, form_data: { subscription_id: 'subscription_id' }) }
  let!(:customer)    { create(:payment_braintree_customer, member: member) }
  let(:subscription) do
    create(:payment_braintree_subscription,
           action: action,
           subscription_id: 'subscription_id',
           # The transaction amount given by Braintree on the test webhook
           amount: 49.99)
  end

  subject do
    PaymentProcessor::Braintree::WebhookHandler
      .handle(notification[:bt_signature], notification[:bt_payload])
  end

  describe 'subscription charged event' do
    context 'when subscription is found' do
      let(:notification) do
        notification_faker(
          Braintree::WebhookNotification::Kind::SubscriptionChargedSuccessfully,
          subscription.subscription_id
        )
      end

      it 'returns true' 


      it 'writes transaction' 


      it 'posts a successful subscription payment event to the queue' 

    end

    context 'when subscription is not found' do
      let(:notification) do
        notification_faker(
          Braintree::WebhookNotification::Kind::SubscriptionChargedSuccessfully,
          'invalid_subscription_id'
        )
      end

      it 'does not write transaction' 


      # We're failing silently if the subscription isn't persisted locally because we get a lot of webhooks
      # for subscriptions that were created on our legacy platform.
      it 'fails silently' 

    end
  end

  describe 'subscription cancelled event' do
    context 'when subscription is found' do
      let(:notification) do
        notification_faker(
          Braintree::WebhookNotification::Kind::SubscriptionCanceled,
          subscription.subscription_id
        )
      end

      it 'updates subscription' 


      it 'pushes an event to the queue' 

    end
  end

  describe 'failed subscription charge' do
    let(:notification) do
      notification_faker(
        Braintree::WebhookNotification::Kind::SubscriptionChargedUnsuccessfully,
        subscription.subscription_id
      )
    end

    it 'creates a failed transaction locally' 


    it 'pushes a failed subscription charge event to the queue' 

  end

  # This describes the event where we have updated the subscription on the Braintree dashboard but not on Champaign
  describe 'subscription that comes in with a different amount from the original' do
    let(:action) { create(:action, member: member, form_data: { subscription_id: 'subscription_id' }) }

    let!(:existing_subscription) do
      create(:payment_braintree_subscription,
             action: action,
             subscription_id: 'subscription_id',
             amount: 5)
    end

    let(:notification) do
      notification_faker(
        Braintree::WebhookNotification::Kind::SubscriptionChargedSuccessfully,
        existing_subscription.subscription_id
      )
    end

    let(:parsed_notification) do
      double('notification',
             bt_signature: 'bt_signature',
             bt_payload: 'bt_payload',
             kind: 'subscription_charged_successfully',
             subscription: double('notification_subscription',
                                  id: 'subscription_id',
                                  transactions: [double('transaction', amount: 10)]))
    end

    before do
      allow(::Braintree::WebhookNotification).to receive(:parse).and_return(parsed_notification)
    end

    it 'updates the local subscription record' 


    it 'publishes a subscription update event and a charge event with the new amount' 

  end
end

