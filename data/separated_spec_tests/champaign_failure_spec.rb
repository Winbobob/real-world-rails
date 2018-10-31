# frozen_string_literal: true
require 'rails_helper'

shared_examples 'creates nothing' do
  it 'does not create an Action' 

  it 'does not create a Member' 

  it 'does not create a BraintreeSubscription' 

  it "does not increment the Page's action count" 

  it 'does not leave a cookie' 

  it 'does not post to the queue' 

  it 'responds with 422' 

end

shared_examples 'processor errors' do
  it 'serializes processor errors in JSON' 

end

describe 'Braintree API' do
  let(:page) { create(:page, title: 'The more money we come across, the more problems we see') }
  let(:form) { create(:form) }
  let(:token_format) { /[a-z0-9]{1,36}/i }
  let(:user) do
    {
      form_id:  form.id,
      name:     'bob fischer',
      email:    'bob@example.com',
      postal:   '12345',
      address1: 'Lynda Vista',
      country:  'US'
    }
  end

  let(:params) do
    {
      currency:   'EUR',
      amount:     '2002.00', # triggers credit limit exceeded
      recurring:  false,
      payment_method_nonce: 'fake-valid-nonce',
      user: user,
      store_in_vault: true
    }
  end

  before :each do
    allow(ChampaignQueue).to receive(:push)
  end

  describe 'unsuccessfuly' do
    describe 'making a transaction' do
      describe 'when Member exists' do
        let!(:member) { create :member, email: user[:email], postal: nil }

        describe 'with invalid user fields' do
          let(:user) do
            {
              form_id:  form.id,
              name:     'a' * 365,
              email:    'bob@example.com',
              postal:   'invalid postal code',
              address1: 'Lynda Vista',
              country:  'US'
            }
          end

          describe 'with credit card' do
            subject do
              VCR.use_cassette('transaction invalid user') do
                post api_payment_braintree_transaction_path(page.id), params: params
              end
            end

            include_examples 'creates nothing'

            it 'does not create a BraintreeCustomer' 


            it 'does not create a Transaction' 


            it 'does not update the member' 


            it 'returns error messages in JSON body' 

          end

          describe 'with Paypal' do
            let(:paypal_params) do
              params.merge(payment_method_nonce: 'fake-paypal-future-nonce', merchant_account_id: 'EUR')
            end

            subject do
              VCR.use_cassette('transaction invalid user with paypal') do
                post api_payment_braintree_transaction_path(page.id), params: paypal_params
              end
            end

            include_examples 'creates nothing'

            it 'does not create a BraintreeCustomer' 


            it 'does not create a Transaction' 


            it 'does not update the member' 


            it 'returns error messages in JSON body' 

          end
        end

        describe 'when BraintreeCustomer is new' do
          describe 'with basic params' do
            subject do
              VCR.use_cassette('transaction processor declined') do
                post api_payment_braintree_transaction_path(page.id), params: params.merge(store_in_vault: true)
              end
            end

            include_examples 'creates nothing'
            include_examples 'processor errors'

            it 'does not create a new Payment::Braintree::Customer' 


            it 'does not update the member' 


            it 'creates a transaction' 


            it 'creates a Transaction associated with the page storing relevant info' 

          end

          describe 'with Paypal' do
            let(:paypal_params) do
              params.merge(payment_method_nonce: 'fake-paypal-future-nonce', merchant_account_id: 'EUR')
            end

            subject do
              VCR.use_cassette('transaction paypal processor declined') do
                post api_payment_braintree_transaction_path(page.id), params: paypal_params
              end
            end

            include_examples 'creates nothing'
            include_examples 'processor errors'

            it 'does not create a Payment::Braintree::Customer' 


            it 'does not update the member' 


            it 'creates a Transaction associated with the page storing relevant info' 

          end
        end

        describe 'when BraintreeCustomer exists' do
          describe 'with Paypal' do
            let!(:member) { create :member, email: user[:email], postal: nil }
            let(:paypal_params) do
              params.merge(payment_method_nonce: 'fake-paypal-future-nonce', merchant_account_id: 'EUR')
            end
            let!(:braintree_customer) do
              create(:payment_braintree_customer, email: user[:email], customer_id: '29823405', member_id: member.id)
            end

            subject do
              VCR.use_cassette('transaction paypal processor declined') do
                post api_payment_braintree_transaction_path(page.id), params: paypal_params
              end
            end

            include_examples 'creates nothing'
            include_examples 'processor errors'

            it 'does not create a BraintreeCustomer' 


            it 'does not update the member' 


            it 'does not update the BraintreeCustomer in the database' 


            it 'creates a Transaction associated with the page storing relevant info' 

          end
        end
      end

      describe 'when Member is new' do
        describe 'when BraintreeCustomer is new' do
          describe 'with basic params' do
            subject do
              VCR.use_cassette('transaction processor declined') do
                post api_payment_braintree_transaction_path(page.id), params: params
              end
            end

            include_examples 'creates nothing'
            include_examples 'processor errors'

            it 'does not create a Payment::Braintree::Customer' 

          end

          describe 'with invalid currency' do
            before do
              params[:currency] = 'JPN'
            end

            it 'raises relevant error' 

          end
        end
      end
    end
    describe 'making a subscription' do
      let(:subscription_params) { params.merge(recurring: true) }

      describe 'when Member exists' do
        let!(:member) { create :member, email: user[:email], postal: nil }

        describe 'when BraintreeCustomer exists' do
          let!(:customer) { create :payment_braintree_customer, member: member, customer_id: '29823405', card_last_4: '4843' }

          describe 'when it fails updating the Customer' do
            let(:failing_params) do
              subscription_params.merge(user: user.merge(name: 'John Johnny ' * 60, amount: 12))
            end

            subject do
              VCR.use_cassette('customer update failure') do
                post api_payment_braintree_transaction_path(page.id), params: failing_params
              end
            end

            include_examples 'creates nothing'

            it 'does not create a BraintreeCustomer' 


            it 'does not update the customer' 


            it 'does not create a Transaction' 


            it 'serializes errors in JSON' 

          end

          describe 'when it fails creating the PaymentMethod' do
            let(:failing_params) do
              subscription_params.merge(user: user.merge(street_address: 'Del colegio Verde Sonrisa, una cuadra arriba, una cuadra al sur, la casa amarilla en la esquina, numero 166 ' * 3, amount: 12))
            end

            subject do
              VCR.use_cassette('payment_method_create_failure') do
                post api_payment_braintree_transaction_path(page.id), params: failing_params
              end
            end

            include_examples 'creates nothing'

            it 'does not create a BraintreeCustomer' 


            it 'does not update the customer' 


            it 'does not create a Transaction' 


            it 'serializes errors in JSON' 

          end
          describe 'when it fails creating the Subscription' do
            subject do
              VCR.use_cassette('subscription create failure with existing customer') do
                post api_payment_braintree_transaction_path(page.id), params: subscription_params
              end
            end

            include_examples 'creates nothing'

            it 'does not create a BraintreeCustomer' 


            it 'does not update the customer' 


            it 'does not create a Transaction' 


            include_examples 'processor errors'
          end
        end
        describe 'when BraintreeCustomer is new' do
          describe 'when it fails creating the Customer' do
            let(:failing_params) do
              subscription_params.merge(user: user.merge(name: 'John Johnny ' * 60, amount: 12))
            end

            subject do
              VCR.use_cassette('customer create failure') do
                post api_payment_braintree_transaction_path(page.id), params: failing_params
              end
            end

            include_examples 'creates nothing'

            it 'does not create a BraintreeCustomer' 


            it 'does not create a Transaction' 


            it 'serializes errors in JSON' 

          end

          describe 'when it fails creating the Subscription' do
            subject do
              VCR.use_cassette('subscription create failure') do
                post api_payment_braintree_transaction_path(page.id), params: subscription_params
              end
            end

            include_examples 'creates nothing'
            include_examples 'processor errors'

            it 'does not create a BraintreeCustomer' 


            it 'does not create a Transaction' 

          end
        end
      end
      describe 'when Member is new' do
        describe 'when BraintreeCustomer is new' do
          describe 'when it fails creating the Customer' do
            let(:failing_params) do
              subscription_params.merge(user: user.merge(name: 'John Johnny ' * 60, amount: 12))
            end

            subject do
              VCR.use_cassette('customer create failure') do
                post api_payment_braintree_transaction_path(page.id), params: failing_params
              end
            end

            include_examples 'creates nothing'

            it 'does not create a BraintreeCustomer' 


            it 'does not create a Transaction' 


            it 'serializes errors in JSON' 

          end

          describe 'when it fails creating the Subscription' do
            subject do
              VCR.use_cassette('subscription create failure') do
                post api_payment_braintree_transaction_path(page.id), params: subscription_params
              end
            end

            include_examples 'creates nothing'
            include_examples 'processor errors'

            it 'does not create a BraintreeCustomer' 


            it 'does not create a Transaction' 

          end
        end
      end
    end
  end
end

