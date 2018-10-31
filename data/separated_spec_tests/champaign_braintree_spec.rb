# coding: utf-8
# frozen_string_literal: true

require 'rails_helper'

describe 'Express Donation' do
  include Requests::RequestHelpers
  let!(:page) { create(:page, slug: 'hello-world', title: 'Hello World') }
  let(:form)  { create(:form) }

  let(:member)          { create(:member, email: 'test@example.com') }
  let(:customer)        { create(:payment_braintree_customer, member: member) }
  let!(:payment_method) { create(:payment_braintree_payment_method, customer: customer, token: '6vg2vw') }

  before do
    allow(ChampaignQueue).to receive(:push)
  end

  describe 'making multiple transactions on the same page' do
    subject do
      body = {
        payment: {
          amount: 2.00,
          payment_method_id: payment_method.id,
          currency: 'GBP',
          recurring: false
        },
        user: {
          form_id: form.id,
          email:   'test@example.com',
          name:    'John Doe'
        },
        page_id: page.id
      }
      post api_payment_braintree_one_click_path(page.id), params: body
      post api_payment_braintree_one_click_path(page.id), params: body
    end

    it 'creates an action and a transaction for each payment' 

  end

  describe 'subscription' do
    before do
      VCR.use_cassette('braintree_express_donation_subscription') do
        body = {
          payment: {
            amount: 2.00,
            payment_method_id: payment_method.id,
            currency: 'GBP',
            recurring: true
          },
          user: {
            form_id: form.id,
            email:   'test@example.com',
            name:    'John Doe'
          },
          page_id: page.id
        }

        post api_payment_braintree_one_click_path(page.id), params: body
      end
    end

    it 'sets donor status to "recurring_donor"' 


    describe 'local record' do
      it 'creates action' 


      it 'creates subscription' 

    end
  end

  context 'Braintree Error responses' do
    describe 'transaction' do
      before do
        VCR.use_cassette('express_donations_invalid_payment_method') do
          result = Braintree::Transaction.sale(
            payment_method_nonce: 'fake-processor-declined-visa-nonce'
          )

          allow_any_instance_of(PaymentProcessor::Braintree::OneClick).to(
            receive(:run).and_return(result)
          )

          body = {
            payment: {
              amount: 2.00,
              payment_method_id: payment_method.id,
              currency: 'GBP',
              recurring: false
            },
            user: {
              form_id: form.id,
              email:   'test@example.com',
              name:    'John Doe'
            },
            page_id: page.id
          }

          post api_payment_braintree_one_click_path(page.id), params: body
        end
      end

      it 'responds with a 422 status code' 


      it 'body contains errors serialised' 


      it 'body contains an error message' 


      it 'body contains braintree params' 

    end
  end

  describe 'transaction' do
    before do
      allow(Braintree::Transaction).to receive(:sale).and_call_original
      VCR.use_cassette('braintree_express_donation') do
        body = {
          payment: {
            amount: 2.00,
            payment_method_id: payment_method.id,
            currency: 'gbp',
            recurring: false
          },
          user: {
            form_id: form.id,
            email:   'test@example.com',
            name:    'John Doe'
          },
          page_id: page.id
        }

        post api_payment_braintree_one_click_path(page.id), params: body
      end
    end

    describe 'local record' do
      it 'creates action' 


      it 'creates transaction' 


      it 'sets donor status to "donor"' 

    end

    it 'creates transaction on braintree' 


    it 'posts a donation to the queue with action_express_donation custom field' 


    it 'submits the transaction for settlement' 


    it 'calls the Braintree API with the merchant_account_id' 

  end
end

describe 'Braintree API' do
  let(:page) do
    create(:page,
           title: 'Cash rules everything around me',
           follow_up_plan: :with_liquid,
           follow_up_liquid_layout: follow_up_liquid_layout)
  end
  let(:follow_up_liquid_layout) { create :liquid_layout }
  let(:follow_up_url) { "/a/cash-rules-everything-around-me/follow-up?member_id=#{Member.last.id}" }
  let(:form) { create(:form) }
  let(:four_digits) { /[0-9]{4}/ }
  let(:token_format) { /[a-z0-9]{1,36}/i }
  let(:user_params) do
    {
      form_id: '100',
      name: 'Bernie Sanders',
      email: 'itsme@feelthebern.org',
      postal: '11225',
      phone: '2135551234',
      address1: '25 Elm Drive',
      akid: '1234.5678.9910',
      source: 'fb',
      action_registered_voter: '1',
      country: 'US'
    }
  end

  let(:meta) do
    hash_including(title:      'Cash rules everything around me',
                   uri:        '/a/cash-rules-everything-around-me',
                   slug:       'cash-rules-everything-around-me',
                   first_name: 'Bernie',
                   last_name:  'Sanders',
                   country: 'United States',
                   action_id: instance_of(Integer))
  end

  let(:action_express_donation) { 0 }
  let(:user_express_cookie) { 0 }

  let(:donation_push_params) do
    {
      type: 'donation',
      meta: meta,
      payment_provider: 'braintree',
      params: {
        donationpage: {
          name: 'cash-rules-everything-around-me-donation',
          payment_account: 'Braintree EUR'
        },
        order: hash_including(
          amount: amount.to_s,
          card_num: '1881',
          card_code: '007',
          exp_date_month: '12',
          exp_date_year: '2020',
          currency: 'EUR'
        ),
        user: hash_including(
          email: 'itsme@feelthebern.org',
          country: 'United States',
          postal: '11225',
          address1: '25 Elm Drive',
          first_name: 'Bernie',
          last_name: 'Sanders',
          phone: '2135551234',
          akid: '1234.5678.9910',
          source: 'fb',
          user_en: 1,
          user_express_cookie: user_express_cookie
        ),
        action: {
          source: 'fb',
          fields: hash_including(
            action_registered_voter: '1',
            action_mobile: 'desktop',
            action_express_donation: action_express_donation
          )
        },
        referring_akid: nil
      }
    }
  end

  before :each do
    allow(ChampaignQueue).to receive(:push)
    allow(Analytics::Page).to receive(:increment)
    allow(MobileDetector).to receive(:detect).and_return(action_mobile: 'desktop')
  end

  describe 'making a transaction' do
    context 'successfully' do
      describe 'making multiple transactions on the same page' do
        let(:first_donation) do
          {
            currency: 'EUR',
            payment_method_nonce: 'fake-valid-nonce',
            recurring: false,
            amount: 2.00,
            store_in_vault: false,
            user: user_params
          }
        end
        let(:second_donation) do
          {
            currency: 'EUR',
            payment_method_nonce: 'fake-valid-nonce',
            recurring: false,
            amount: 5.00,
            store_in_vault: false,
            user: user_params
          }
        end

        subject do
          post api_payment_braintree_transaction_path(page.id), params: first_donation
          post api_payment_braintree_transaction_path(page.id), params: second_donation
        end

        it 'creates a transaction for each payment' 

      end

      describe "without storing in Braintree's vault" do
        let(:params) do
          {
            currency: 'EUR',
            payment_method_nonce: 'fake-valid-nonce',
            recurring: false,
            amount: 2.00,
            store_in_vault: false,
            user: user_params
          }
        end

        before do
          VCR.use_cassette('braintree_transaction no_vault') do
            post api_payment_braintree_transaction_path(page.id), params: params
          end
        end

        it 'no customer is created' 


        it 'no payment method is created' 


        it 'transaction is created' 


        it 'pushes a new donation action to the ActionKit queue' 

      end

      describe "with storing in Braintree's vault" do
        let(:basic_params) do
          {
            currency: 'EUR',
            payment_method_nonce: 'fake-valid-nonce',
            amount: '2.00',
            recurring: false,
            store_in_vault: true
          }
        end

        let(:user_express_cookie) { 1 }

        context 'when Member exists' do
          let!(:member) { create :member, email: user_params[:email], postal: nil, actionkit_user_id: 'woo_actionkit' }

          context 'when BraintreeCustomer exists' do
            let!(:customer) { create :payment_braintree_customer, member: member, customer_id: 'test', card_last_4: '4843' }

            context 'with basic params' do
              let(:amount) { 23.20 } # to avoid duplicate donations recording specs
              let(:params) { basic_params.merge(user: user_params, amount: amount) }
              subject do
                VCR.use_cassette('transaction success basic existing customer') do
                  post api_payment_braintree_transaction_path(page.id), params: params
                end
              end

              it 'increments redis counters' 


              it 'stores token to cookie' 


              it 'creates an Action associated with the Page and Member' 


              it 'stores amount, currency, card_num, is_subscription, and transaction_id in form_data on the Action' 


              it 'creates a Transaction associated with the page storing relevant info' 


              it 'updates Payment::Braintree::Customer with new token and last_4' 


              it 'posts donation action to queue with key data' 


              it 'increments action count on page' 


              it 'passes the params to braintree' 


              it 'leaves a cookie with the member_id' 


              it 'updates the Member’s fields with any new data' 


              it 'responds successfully with transaction_id' 

            end

            context 'with Paypal' do
              let(:amount) { 29.20 } # to avoid duplicate donations recording specs
              let(:params) { basic_params.merge(user: user_params, payment_method_nonce: 'fake-paypal-future-nonce', amount: amount, store_in_vault: true) }

              subject do
                VCR.use_cassette('transaction success paypal existing customer') do
                  post api_payment_braintree_transaction_path(page.id), params: params
                end
              end

              it 'creates a Transaction associated with the page storing relevant info' 


              it 'updates Payment::Braintree::Customer with new token and PYPL for last_4' 


              it 'stores PYPL as card_num on the Action' 


              it 'passes PYPL as card_num to queue' 


              it 'responds successfully with transaction_id' 


              it 'persists payment_method' 

            end
          end

          context 'when BraintreeCustomer is new' do
            context 'with basic params' do
              let(:amount) { 13.20 } # to avoid duplicate donations recording specs
              let(:params) { basic_params.merge(user: user_params, amount: amount) }
              subject do
                VCR.use_cassette('transaction success basic new customer') do
                  post api_payment_braintree_transaction_path(page.id), params: params
                end
              end

              it 'persists payment method for customer' 


              it 'creates an Action associated with the Page and Member' 


              it 'stores amount, currency, card_num, is_subscription, and transaction_id in form_data on the Action' 


              it 'creates a Transaction associated with the page storing relevant info' 


              it 'creates new Payment::Braintree::Customer including token, customer_id, and last four for credit card' 


              it 'posts donation action to queue with key data' 


              it 'increments action count on page' 


              it 'passes the params to braintree' 


              it 'leaves a cookie with the member_id' 


              it 'updates the Member’s fields with any new data' 


              it 'responds successfully with transaction_id' 

            end

            context 'with Paypal' do
              let(:amount) { 19.20 } # to avoid duplicate donations recording specs
              let(:params) { basic_params.merge(user: user_params, payment_method_nonce: 'fake-paypal-future-nonce', amount: amount) }

              subject do
                VCR.use_cassette('transaction success paypal new customer') do
                  post api_payment_braintree_transaction_path(page.id), params: params
                end
              end

              it 'creates a Transaction associated with the page storing relevant info' 


              it 'creates a Payment::Braintree::Customer with customer_id and PYPL for last 4' 


              it 'stores PYPL as card_num on the Action' 


              it 'passes PYPL as card_num to queue' 


              it 'responds successfully with transaction_id' 

            end
          end
        end

        context 'when Member is new' do
          context 'when BraintreeCustomer is new' do
            context 'with basic params' do
              # we're using the same casette as above anyway, so we're only running specs
              # relevant to the new member

              let(:amount) { 13.20 } # to avoid duplicate donations recording specs
              let(:params) { basic_params.merge(user: user_params, amount: amount) }

              subject do
                VCR.use_cassette('transaction success basic new customer') do
                  post api_payment_braintree_transaction_path(page.id), params: params
                end
              end

              it 'increments redis counters' 


              it 'creates an Action associated with the Page and Member' 


              it 'leaves a cookie with the member_id' 


              it 'populates the Member’s fields with form data' 


              it 'responds successfully with transaction_id' 

            end
          end
        end
      end
    end
  end

  describe 'making a subscription' do
    describe 'successfully' do
      let(:basic_params) do
        {
          currency: 'EUR',
          payment_method_nonce: 'fake-valid-nonce',
          # amount: amount, # should override for each casette to avoid duplicates
          recurring: true
        }
      end

      let(:donation_push_params) do
        {
          type: 'donation',
          payment_provider: 'braintree',
          meta: meta,
          params: {
            donationpage: {
              name: 'cash-rules-everything-around-me-donation',
              payment_account: 'Braintree EUR'
            },
            order: {
              amount: amount.to_s,
              card_num: '1881',
              card_code: '007',
              exp_date_month: '12',
              exp_date_year: '2020',
              currency: 'EUR'
            },
            user: {
              email: 'itsme@feelthebern.org',
              country: 'United States',
              postal: '11225',
              address1: '25 Elm Drive',
              name: 'Bernie Sanders',
              first_name: 'Bernie',
              last_name: 'Sanders',
              phone: '2135551234',
              akid: '1234.5678.9910',
              source: 'fb',
              user_en: 1,
              user_express_cookie: user_express_cookie,
              user_express_account: 0
            },
            action: {
              source: 'fb',
              fields: {
                action_registered_voter: '1',
                action_mobile: 'desktop',
                action_express_donation: 0
              }
            },
            referring_akid: nil
          }
        }
      end

      context 'when Member exists' do
        let!(:member) { create :member, email: user_params[:email], postal: nil }

        before do
          donation_push_params[:params][:order][:recurring_id] = /[a-z0-9]{6}/
        end

        context 'when BraintreeCustomer exists' do
          let!(:customer) { create :payment_braintree_customer, member: member, customer_id: '29823405', card_last_4: '4843' }

          context 'with basic params' do
            let(:amount) { 823.20 } # to avoid duplicate donations recording specs
            let(:params) { basic_params.merge(user: user_params, amount: amount) }

            subject do
              VCR.use_cassette('subscription success basic existing customer') do
                post api_payment_braintree_transaction_path(page.id), params: params
              end
            end

            it 'increments redis counters' 


            it 'creates an Action associated with the Page and Member' 


            it 'stores amount, currency, card_num, is_subscription, transaction_id, and subscription_id in form_data on the Action' 


            it 'does not create a transaction' 


            it 'creates a Subscription associated with the page storing relevant info' 


            it 'creates a Subscription associated with a customer and payment method' 


            it 'updates Payment::Braintree::Customer with new token and last_4' 


            it 'posts donation action to queue with key data' 


            it 'increments action count on page' 


            it 'passes the subscription params to braintree' 


            it 'passes the customer params to braintree' 


            it 'passes the payment params to braintree' 


            it 'leaves a cookie with the member_id' 


            it 'updates the Member’s fields with any new data' 


            it 'responds successfully with follow_up_url and subscription_id' 

          end

          context 'with Paypal' do
            let(:amount) { 829.20 } # to avoid duplicate donations recording specs
            let(:params) { basic_params.merge(user: user_params, payment_method_nonce: 'fake-paypal-future-nonce', amount: amount) }

            subject do
              VCR.use_cassette('subscription success paypal existing customer') do
                params[:store_in_vault] = true
                post api_payment_braintree_transaction_path(page.id), params: params
              end
            end

            it 'increments redis counters' 


            it 'does not create a transaction' 


            it 'updates Payment::Braintree::Customer with new token and PYPL for last_4' 


            it 'stores PYPL as card_num on the Action' 


            it 'passes PYPL as card_num to queue' 


            it 'responds successfully with follow_up_url and subscription_id' 

          end
        end

        context 'when BraintreeCustomer is new' do
          context 'with basic params' do
            let(:amount) { 813.20 } # to avoid duplicate donations recording specs
            let(:params) { basic_params.merge(user: user_params, amount: amount) }

            subject do
              VCR.use_cassette('subscription success basic new customer') do
                post api_payment_braintree_transaction_path(page.id), params: params
              end
            end

            it 'increments redis counters' 


            it 'creates an Action associated with the Page and Member' 


            it 'stores amount, currency, card_num, is_subscription, and subscription_id in form_data on the Action' 


            it 'does not create a transaction' 


            it 'creates a Subscription associated with the page storing relevant info' 


            it 'creates a Payment::Braintree::Customer with new token, customer_id, and last_4' 


            it 'creates a Subscription associated with the newly created payment method' 


            it 'posts donation action to queue with key data' 


            it 'increments action count on page' 


            it 'passes the subscription params to braintree' 


            it 'passes the customer params and nonce to braintree' 


            it 'does not create payment method separately' 


            it 'leaves a cookie with the member_id' 


            it 'updates the Member’s fields with any new data' 


            it 'responds successfully with follow_up_url and subscription_id' 


            it 'persists payment_method' 

          end

          context 'with Paypal' do
            let(:amount) { 819.20 } # to avoid duplicate donations recording specs
            let(:params) { basic_params.merge(user: user_params, payment_method_nonce: 'fake-paypal-future-nonce', amount: amount) }

            subject do
              VCR.use_cassette('subscription success paypal new customer') do
                post api_payment_braintree_transaction_path(page.id), params: params
              end
            end

            it 'increments redis counters' 


            it 'does not create a transaction' 


            it 'persists payment_method' 


            it 'creates a Payment::Braintree::Customer with customer_id and PYPL for last 4' 


            it 'stores PYPL as card_num on the Action' 


            it 'passes PYPL as card_num to queue' 


            it 'responds successfully with follow_up_url and subscription_id' 

          end
        end
      end

      context 'when Member is new' do
        context 'when BraintreeCustomer is new' do
          context 'with basic params' do
            # we're using the same casette as above anyway, so we're only running specs
            # relevant to the new member

            let(:amount) { 813.20 } # to avoid duplicate donations recording specs
            let(:params) { basic_params.merge(user: user_params, amount: amount) }

            subject do
              VCR.use_cassette('subscription success basic new customer') do
                post api_payment_braintree_transaction_path(page.id), params: params
              end
            end

            it 'increments redis counters' 


            it 'creates an Action associated with the Page and Member' 


            it 'leaves a cookie with the member_id' 


            it 'populates the Member’s fields with form data' 


            it 'responds successfully with follow_up_url and subscription_id' 

          end
        end
      end
    end
  end

  describe 'storing multiple payment method tokens' do
    context 'existing customer' do
      let(:basic_params) do
        {
          currency: 'EUR',
          payment_method_nonce: 'fake-valid-mastercard-nonce',
          recurring: false
        }
      end

      let(:params) { basic_params.merge(user: user_params, amount: 5, store_in_vault: true) }

      subject do
        VCR.use_cassette('transaction_existing_customer_storing_multiple_tokens') do
          post api_payment_braintree_transaction_path(page.id), params: params
        end
      end

      let!(:member)   { create :member, email: user_params[:email], postal: nil }
      let!(:customer) { create(:payment_braintree_customer, member: member, customer_id: 'test', card_last_4: '4843') }

      before do
        3.times do
          Payment::Braintree::PaymentMethod.create(customer: customer)
        end
      end

      it 'supports storing multiple braintree payment method tokens' 


      # This spec describes he rather weird expected behavior at the moment, where we create a payment method token every time.
      it 'always creates a new payment method token, even if the same payment method is used' 

    end

    context 'new customer' do
      let(:params) { basic_params.merge(user: user_params, amount: amount) }
      subject do
        VCR.use_cassette('transaction_existing_customer_storing_multiple_tokens') do
          post api_payment_braintree_transaction_path(page.id), params: params
        end
      end
    end
  end

  describe 'fetching a token' do
    it 'gets a client token' 

  end
end

