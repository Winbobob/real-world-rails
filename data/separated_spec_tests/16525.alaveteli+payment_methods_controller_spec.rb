# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'stripe_mock'

describe AlaveteliPro::PaymentMethodsController, feature: :pro_pricing do
  let(:stripe_helper) { StripeMock.create_test_helper }
  let(:user_token) { stripe_helper.generate_card_token }
  let(:new_token) { stripe_helper.generate_card_token }

  before do
    StripeMock.start
    stripe_helper.create_plan(id: 'pro', amount: 1000)
  end

  after do
    StripeMock.stop
  end

  describe 'POST #update' do

    context 'without a signed-in user' do

      before do
        post :update
      end

      it 'redirects to the login form' 


    end

    context 'with a signed-in user' do
      let(:user) { FactoryBot.create(:pro_user) }

      let(:customer) do
        customer = Stripe::Customer.
                     create(email: user.email, source: user_token)
        user.pro_account.update!(stripe_customer_id: customer.id)
        customer
      end

      let(:old_card_id) { customer.sources.first.id }

      before do
        session[:user_id] = user.id
      end

      it 'finds the card token' 


      it 'finds the id of the card being updated' 


      it 'retrieves the correct Stripe customer' 


      it 'redirects to the account page' 


      context 'with a successful transaction' do

        before do
          post :update, 'stripeToken' => new_token,
                        'old_card_id' => old_card_id
        end

        it 'adds the new card to the Stripe customer' 


        it 'sets the new card as the default' 


        it 'removes the old card from the Stripe customer' 


        it 'shows a message to confirm the update' 


      end

      context 'when the card is declined' do

        before do
          StripeMock.prepare_card_error(:card_declined, :update_customer)

          post :update, 'stripeToken' => new_token,
                        'old_card_id' => old_card_id
        end

        it 'renders the card error message' 


        it 'does not update the stored payment methods' 


      end

      context 'when we are rate limited' do

        before do
          error = Stripe::RateLimitError.new
          StripeMock.prepare_error(error, :update_customer)
          post :update, 'stripeToken' => new_token,
                        'old_card_id' => old_card_id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


      end

      context 'when Stripe receives an invalid request' do

        before do
          error = Stripe::InvalidRequestError.new('message', 'param')
          StripeMock.prepare_error(error, :update_customer)
          post :update, 'stripeToken' => new_token,
                        'old_card_id' => old_card_id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


      end

      context 'when we cannot authenticate with Stripe' do

        before do
          error = Stripe::AuthenticationError.new
          StripeMock.prepare_error(error, :update_customer)
          post :update, 'stripeToken' => new_token,
                        'old_card_id' => old_card_id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


      end

      context 'when we cannot connect to Stripe' do

        before do
          error = Stripe::APIConnectionError.new
          StripeMock.prepare_error(error, :update_customer)
          post :update, 'stripeToken' => new_token,
                        'old_card_id' => old_card_id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


      end

      context 'when Stripe returns a generic error' do

        before do
          error = Stripe::StripeError.new
          StripeMock.prepare_error(error, :update_customer)
          post :update, 'stripeToken' => new_token,
                        'old_card_id' => old_card_id
        end

        it 'sends an exception email' 


        it 'renders an error message' 


      end

    end

  end

end

