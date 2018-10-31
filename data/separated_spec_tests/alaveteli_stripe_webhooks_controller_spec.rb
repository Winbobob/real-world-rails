# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'stripe_mock'

describe AlaveteliPro::StripeWebhooksController, feature: [:alaveteli_pro, :pro_pricing] do

  describe '#receive' do

    let(:config_secret) { 'whsec_secret' }
    let(:signing_secret) { config_secret }
    let(:stripe_helper) { StripeMock.create_test_helper }

    let(:stripe_subscription) do
      customer = Stripe::Customer.
                   create(source: stripe_helper.generate_card_token)
      plan = Stripe::Plan.create(
               id: 'test',
               name: 'Test',
               amount: 10,
               currency: 'gpp',
               interval: 'monthly')
      Stripe::Subscription.create(
        customer: customer,
        plan: 'test'
      )
    end

    let(:paid_invoice) do
      invoice = Stripe::Invoice.create(
        lines: [
          {
            data: {
              id: stripe_subscription.id,
              subscription_item: stripe_subscription.items.data.first.id,
              amount: 100,
              currency: 'gbp',
              type: 'subscription'
            },
            plan: { id: 'test', name: 'Test'}
          }
        ],
        subscription: stripe_subscription.id
      )
      invoice.pay
    end

    let(:charge) { Stripe::Charge.retrieve(paid_invoice.charge) }

    let(:stripe_event) do
      StripeMock.mock_webhook_event('customer.subscription.deleted')
    end

    before do
      config = MySociety::Config.load_default
      config['STRIPE_WEBHOOK_SECRET'] = config_secret
      config['STRIPE_NAMESPACE'] = ''
      StripeMock.start
    end

    after do
      StripeMock.stop
    end

    def encode_hmac(key, value)
      # this is how Stripe signed headers work, method borrowed from:
      # https://github.com/stripe/stripe-ruby/blob/v3.4.1/lib/stripe/webhook.rb#L24-L26
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha256"), key, value)
    end

    let(:payload) { stripe_event.to_s }

    def signed_headers
      timestamp = Time.zone.now.to_i
      secret = encode_hmac(signing_secret, "#{timestamp}.#{payload}")
      {
        'HTTP_STRIPE_SIGNATURE' => "t=#{timestamp},v1=#{secret}",
        'CONTENT_TYPE' => 'application/json'
      }
    end

    it 'returns a successful response for correctly signed headers' 


    context 'the secret is not in the request' do

      it 'returns a 401 Unauthorized response' 


      it 'sends an exception email' 


      it 'includes the error message in the message body' 


    end

    context 'the secret_key does not match' do

      let(:signing_secret) { 'whsec_fake' }

      before do
        request.headers.merge! signed_headers
        post :receive, payload
      end

      it 'returns 401 Unauthorized response' 


      it 'sends an exception email' 


      it 'includes the error message in the message body' 


    end

    context 'receiving an unhandled notification type' do

      let(:payload) do
        stripe_event.
          to_s.gsub!('customer.subscription.deleted', 'custom.random_event')
      end

      it 'sends an exception email' 


    end

    context 'the timestamp is stale (possible replay attack)' do

      let!(:stale_headers) do
        time_travel_to(1.hour.ago) { signed_headers }
      end

      before do
        request.headers.merge! stale_headers
        post :receive, payload
      end

      it 'returns a 401 Unauthorized response' 


      it 'sends an exception email' 


    end

    context 'the notification type is missing' do

      let(:payload) { '{"id": "1234"}' }

      before do
        request.headers.merge! signed_headers
        post :receive, payload
      end

      it 'returns a 400 Bad Request response' 


      it 'sends an exception email' 


    end

    context 'when using namespaced plans' do

      before do
        config = MySociety::Config.load_default
        config['STRIPE_NAMESPACE'] = 'WDTK'
        config['STRIPE_WEBHOOK_SECRET'] = config_secret
      end

      context 'the webhook does not reference our plan namespace' do

        it 'returns a custom 200 response' 


        it 'does not send an exception email' 


      end

      context 'the webhook is for a matching namespaced plan' do

        let(:payload) do
          event = StripeMock.mock_webhook_event(
                    'invoice.payment_succeeded',
                    {
                      lines: paid_invoice.lines,
                      currency: 'gbp',
                      charge: paid_invoice.charge,
                      subscription: paid_invoice.subscription
                    }
                  )
          plan_id = event.data.object.lines.last.plan.id
          event.to_s.
            gsub(/"plan": {\s*"id": "#{plan_id}"/,
                 "\"plan\": {\"id\": \"WDTK-#{plan_id}\"")
        end

        it 'returns a 200 OK response' 


      end

      context 'the webhook data does not have namespaced plans' do

        let(:payload) do
          StripeMock.mock_webhook_event('invoice.payment_succeeded').to_s
        end

        it 'does not raise an error when trying to filter on plan name' 


      end

    end

    describe 'a cancelled subscription is deleted at the end of the billing period' do

      let!(:user) do
        _user = FactoryGirl.create(:pro_user)
        _user.pro_account.stripe_customer_id = stripe_event.data.object.customer
        _user.pro_account.save!
        _user
      end

      it 'removes the pro role from the associated user' 


    end

    describe 'updating the Stripe charge description when a payment succeeds' do

      let(:stripe_event) do
        StripeMock.mock_webhook_event(
          'invoice.payment_succeeded',
          {
            lines: paid_invoice.lines,
            currency: 'gbp',
            charge: paid_invoice.charge,
            subscription: paid_invoice.subscription
          }
        )
      end

      it 'removes the pro role from the associated user' 


    end

  end

end

