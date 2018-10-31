# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require 'stripe_mock'

describe AlaveteliPro::PlansController do
  before { StripeMock.start }
  after { StripeMock.stop }
  let(:stripe_helper) { StripeMock.create_test_helper }
  let!(:pro_plan) { stripe_helper.create_plan(id: 'pro', amount: 1000) }
  let!(:alaveteli_pro_plan) do
    stripe_helper.create_plan(id: 'alaveteli-pro', amount: 1000)
  end

  describe 'GET #index' do

    before do
      get :index
    end

    it 'renders the plans page' 


    it 'returns http success' 


    it 'sets in_pro_area' 


  end

  describe 'GET #show' do

    context 'without a signed-in user' do

      before do
        get :show, id: 'pro'
      end

      it 'redirects to the login form' 


      it 'sets in_pro_area' 


    end

    context 'with a signed-in user' do
      let(:user) { FactoryGirl.create(:user) }

      before do
        session[:user_id] = user.id
      end

      context 'with a valid plan' do

        before do
          get :show, id: 'pro'
        end

        it 'finds the specified plan' 


        it 'renders the plan page' 


        it 'returns http success' 


      end

      context 'with a Stripe namespaced' do

        before do
          allow(AlaveteliConfiguration).to receive(:stripe_namespace).
            and_return('alaveteli')
          get :show, id: 'pro'
        end

        it 'finds the specified plan' 


        it 'renders the plan page' 


        it 'returns http success' 


      end

      context 'with an existing subscription' do

        before do
          session[:user_id] = user.id
          customer =
            Stripe::Customer.create(email: user.email,
                                    source: stripe_helper.generate_card_token)

          Stripe::Subscription.create(customer: customer, plan: 'pro')
          user.create_pro_account(:stripe_customer_id => customer.id)
          user.add_role(:pro)
          get :show, id: 'pro'
        end

        it 'tells the user they already have a plan' 


        it 'redirects to the account page' 

      end

      context 'with an existing customer id but no active subscriptions' do

        before do
          session[:user_id] = user.id
          customer =
            Stripe::Customer.create(email: user.email,
                                    source: stripe_helper.generate_card_token)

          subscription =
            Stripe::Subscription.create(customer: customer, plan: 'pro')

          subscription.delete
          user.create_pro_account(:stripe_customer_id => customer.id)
          get :show, id: 'pro'
        end

        it 'renders the plan page' 


        it 'returns http success' 


      end

      context 'with an invalid plan' do

        it 'returns ActiveRecord::RecordNotFound' 


      end

    end

  end

end

