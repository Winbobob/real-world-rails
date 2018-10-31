# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'stripe_mock'

describe AlaveteliPro::SubscriptionsController, feature: :pro_pricing do
  let(:stripe_helper) { StripeMock.create_test_helper }

  before do
    StripeMock.start
    stripe_helper.create_plan(id: 'pro', amount: 1000)
    stripe_helper.create_coupon(
      id: 'COUPON_CODE',
      amount_off: 1000,
      currency: 'gbp'
    )
    stripe_helper.create_coupon(
      id: 'ALAVETELI-COUPON_CODE',
      amount_off: 1000,
      currency: 'gbp'
    )
  end

  after do
    StripeMock.stop
  end

  describe 'POST #create' do

    context 'without a signed-in user' do

      before do
        post :create
      end

      it 'redirects to the login form' 


    end

    context 'with a signed-in user' do
      let(:token) { stripe_helper.generate_card_token }
      let(:user) { FactoryBot.create(:user) }

      before do
        session[:user_id] = user.id
      end

      RSpec.shared_examples 'successful example' do
        it 'finds the token' 


        it 'creates a new Stripe customer' 


        it 'subscribes the user to the plan' 


        it 'creates a pro account for the user' 


        it 'stores the stripe_customer_id in the pro_account' 


        it 'adds the pro role' 


        it 'does not enable pop polling by default' 


        it 'enables daily summary notifications for the user' 


        it 'enables batch for the user' 


        it 'welcomes the new user' 


        it 'redirects to the pro dashboard' 


        it 'sets new_pro_user in flash' 


      end

      # technically possible but have only managed to do so locally (and with
      # Safari) but just in case...
      context 'the form is resubmitted' do

        let(:token) { stripe_helper.generate_card_token }
        let(:user) { FactoryBot.create(:user) }

        before do
          session[:user_id] = user.id
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        it 'does not create a duplicate subscription' 


        it 'redirects to the dashboard' 


      end

      context 'the user previously had some pro features enabled' do

        def successful_signup
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => 'coupon_code'
        end

        it 'does not raise an error if the user already uses the poller' 


        it 'does not raise an error if the user already has notifications' 


        it 'does not raise an error if the user already has batch' 


      end

      context 'with a successful transaction' do
        before do
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        include_examples 'successful example'
      end

      context 'when pop polling is enabled' do

        before do
          allow(AlaveteliConfiguration).
            to receive(:production_mailer_retriever_method).
            and_return('pop')

          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        it 'enables pop polling for the user' 


      end

      context 'with coupon code' do
        before do
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => 'coupon_code'
        end

        include_examples 'successful example'

        it 'uses coupon code' 

      end

      context 'with Stripe namespace and coupon code' do
        before do
          allow(AlaveteliConfiguration).to receive(:stripe_namespace).
            and_return('alaveteli')

          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => 'coupon_code'
        end

        include_examples 'successful example'

        it 'uses namespaced coupon code' 

      end

      context 'with an existing customer but no active subscriptions' do

        before do
          customer =
            Stripe::Customer.create(email: user.email,
                                    source: stripe_helper.generate_card_token)
          user.create_pro_account(:stripe_customer_id => customer.id)

          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        include_examples 'successful example'

        it 'uses the existing stripe customer record' 


        it 'updates the source from the new token' 

      end

      context 'when the card is declined' do

        before do
          StripeMock.prepare_card_error(:card_declined, :create_subscription)
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        it 'renders the card error message' 


        it 'redirects to the plan page' 


        it 'does not set new_pro_user in flash' 


      end

      context 'when we are rate limited' do

        before do
          error = Stripe::RateLimitError.new
          StripeMock.prepare_error(error, :create_subscription)
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the plan page' 


      end

      context 'when Stripe receives an invalid request' do

        before do
          error = Stripe::InvalidRequestError.new('message', 'param')
          StripeMock.prepare_error(error, :create_subscription)
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the plan page' 


      end

      context 'when we cannot authenticate with Stripe' do

        before do
          error = Stripe::AuthenticationError.new
          StripeMock.prepare_error(error, :create_subscription)
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the plan page' 


      end

      context 'when we cannot connect to Stripe' do

        before do
          error = Stripe::APIConnectionError.new
          StripeMock.prepare_error(error, :create_subscription)
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the plan page' 


      end

      context 'when Stripe returns a generic error' do

        before do
          error = Stripe::StripeError.new
          StripeMock.prepare_error(error, :create_subscription)
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => ''
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the plan page' 


      end

      context 'when uses invalid coupon' do

        before do
          error = Stripe::InvalidRequestError.new('No such coupon', 'param')
          StripeMock.prepare_error(error, :create_subscription)
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => 'INVALID'
        end

        it 'does not sends an exception email' 


        it 'renders an notice message' 


        it 'redirects to the plan page' 


      end

      context 'when uses expired coupon' do

        before do
          error = Stripe::InvalidRequestError.new('Coupon expired', 'param')
          StripeMock.prepare_error(error, :create_subscription)
          post :create, 'stripeToken' => token,
                        'stripeTokenType' => 'card',
                        'stripeEmail' => user.email,
                        'plan_id' => 'pro',
                        'coupon_code' => 'EXPIRED'
        end

        it 'does not sends an exception email' 


        it 'renders an notice message' 


        it 'redirects to the plan page' 


      end

      context 'when invalid params are submitted' do

        it 'redirects to the plan page if there is a plan' 


        it 'redirects to the pricing page if there is no plan' 


      end

    end

  end

  describe 'GET #index' do

    context 'without a signed-in user' do

      before do
        get :index
      end

      it 'redirects to the login form' 


    end

    context 'user has no Stripe id' do

      let(:user) { FactoryBot.create(:pro_user) }

      before do
        session[:user_id] = user.id
      end

      it 'redirects to the pricing page' 


    end

    context 'with a signed-in user' do

      let(:user) { FactoryBot.create(:pro_user) }

      let!(:customer) do
        stripe_helper.create_plan(id: 'test')
        customer = Stripe::Customer.create({
          email: user.email,
          source: stripe_helper.generate_card_token,
          plan: 'test'
        })
        user.pro_account.update!(stripe_customer_id: customer.id)
        customer
      end

      before do
        session[:user_id] = user.id
      end

      it 'successfully loads the page' 


      it 'finds the Stripe subscription for the user' 


      it 'assigns subscriptions' 


      it 'assigns the default source as card' 


      context 'if a PRO_REFERRAL_COUPON is blank' do

        it 'does not assign the discount code' 


        it 'does not assign the discount terms' 


      end

      context 'if a PRO_REFERRAL_COUPON is set' do

        before do
          allow(AlaveteliConfiguration).
            to receive(:pro_referral_coupon).and_return('PROREFERRAL')
          allow(AlaveteliConfiguration).
            to receive(:stripe_namespace).and_return('ALAVETELI')
        end

        let!(:coupon) do
          stripe_helper.create_coupon(
            percent_off: 50,
            duration: 'repeating',
            duration_in_months: 1,
            id: 'ALAVETELI-PROREFERRAL',
            metadata: { humanized_terms: '50% off for 1 month' }
          )
        end

        it 'assigns the discount code, stripping the stripe namespace' 


        it 'assigns the discount terms' 


        it 'rescues from any stripe error' 


      end

    end

  end

  describe 'DELETE #destroy' do

    context 'without a signed-in user' do

      before do
        delete :destroy, id: '123'
      end

      it 'redirects to the login form' 


    end

    context 'user has no Stripe id' do

      let(:user) { FactoryBot.create(:pro_user) }

      before do
        session[:user_id] = user.id
      end

      it 'raise an error' 


    end

    context 'with a signed-in user' do

      let(:user) { FactoryBot.create(:pro_user) }

      let(:plan) { stripe_helper.create_plan(id: 'test') }

      let(:customer) do
        customer = Stripe::Customer.create({
          email: user.email,
          source: stripe_helper.generate_card_token,
        })
        user.pro_account.update!(stripe_customer_id: customer.id)
        customer
      end

      let(:subscription) do
        Stripe::Subscription.create(customer: customer, plan: plan.id)
      end

      before do
        session[:user_id] = user.id
        delete :destroy, id: subscription.id
      end

      it 'finds the subscription in Stripe' 


      it 'cancels the subscription at the end of the billing period' 


      it 'informs the user that they have cancelled' 


      it 'redirects to the subscriptions page' 


      context 'when destroying a subscription belonging to another user' do

        let(:other_subscription) do
          customer = Stripe::Customer.create({
            email: 'test@example.org',
            source: stripe_helper.generate_card_token,
          })
          Stripe::Subscription.create(customer: customer, plan: plan.id)
        end

        it 'raises an error' 

      end

      context 'when we are rate limited' do

        before do
          error = Stripe::RateLimitError.new
          StripeMock.prepare_error(error, :cancel_subscription)
          delete :destroy, id: subscription.id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the subscriptions page' 


      end

      context 'when Stripe receives an invalid request' do

        before do
          error = Stripe::InvalidRequestError.new('message', 'param')
          StripeMock.prepare_error(error, :cancel_subscription)
          delete :destroy, id: subscription.id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the subscriptions page' 


      end

      context 'when we cannot authenticate with Stripe' do

        before do
          error = Stripe::AuthenticationError.new
          StripeMock.prepare_error(error, :cancel_subscription)
          delete :destroy, id: subscription.id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the subscriptions page' 


      end

      context 'when we cannot connect to Stripe' do

        before do
          error = Stripe::APIConnectionError.new
          StripeMock.prepare_error(error, :cancel_subscription)
          delete :destroy, id: subscription.id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the subscriptions page' 


      end

      context 'when Stripe returns a generic error' do

        before do
          error = Stripe::StripeError.new
          StripeMock.prepare_error(error, :cancel_subscription)
          delete :destroy, id: subscription.id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


        it 'redirects to the subscriptions page' 


      end

      context 'when invalid params are submitted' do

        it 'redirects to the plan page if there is a plan' 


      end

    end

  end

end

