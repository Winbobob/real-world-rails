# frozen_string_literal: true

require 'rails_helper'

module PaymentProcessor
  module Braintree
    describe Transaction do
      describe '.make_transaction' do
        before do
          allow(MerchantAccountSelector).to receive(:for_currency) { '123' }
          allow(::Braintree::Transaction).to receive(:sale) { transaction }
          allow(ManageBraintreeDonation).to receive(:create) { action }
          allow(Payment::Braintree).to receive(:write_transaction)
        end

        let(:member) { create(:member, email: 'test@example.com') }
        let(:store) { nil }
        let(:action) { create(:action, member: member) }
        let(:transaction) { instance_double('Braintree::SuccessResult', success?: true) }
        let(:failure) { instance_double('Braintree::ErrorResult', success?: false) }

        let(:required_options) do
          {
            nonce: 'a_nonce',
            amount: 100,
            currency: 'USD',
            user: { email: 'test@example.com', name: 'Bob' },
            page_id: 1,
            device_data: { foo: 'bar' }
          }
        end

        subject { described_class }

        %i[nonce amount currency user page_id].each do |keyword|
          it "requires a #{keyword}" 

        end

        it 'passes basic arguments' 


        it 'passes customer_id' 


        describe 'result' do
          it 'returns the Braintree result object' 

        end

        describe 'error_container' do
          it 'returns the Braintree result object when success' 


          it 'returns the Braintree result object when failure' 

        end

        describe 'action' do
          it 'returns the Action object when successful' 


          it 'returns nil when unsuccessful' 

        end

        describe 'customer field' do
          describe 'includes name if' do
            let(:name_expectation) do
              a_hash_including(
                customer: a_hash_including(
                  first_name: 'Frank',
                  last_name: 'Weeki-waki'
                )
              )
            end

            it 'includes name if given as first_name, last_name' 


            it 'includes name if given as full_name' 


            it 'includes name if given as name' 

          end

          it 'passes user email if available' 


          it 'passes an empty string if no known email' 

        end

        describe 'billing field' do
          describe 'postal code' do
            let(:expected) { a_hash_including(billing: a_hash_including(postal_code: '01060')) }

            it 'can be filled by zip' 


            it 'can be filled by zip_code' 


            it 'can be filled by postal' 


            it 'can be filled by postal_code' 


            it 'prioritizes postal_code' 

          end

          describe 'street address' do
            let(:expected) { a_hash_including(billing: a_hash_including(street_address: '71 Pleasant St')) }

            it 'can be filled by address' 


            it 'can be filled by address1' 


            it 'can be filled by street_address' 


            it 'prioritizes street_address' 

          end

          describe 'extended address' do
            let(:expected) { a_hash_including(billing: a_hash_including(extended_address: 'First floor')) }

            it 'can be filled by apartment' 


            it 'can be filled by address2' 


            it 'can be filled by extended_address' 


            it 'prioritizes extended_address' 

          end

          describe 'country' do
            let(:expected) { a_hash_including(billing: a_hash_including(country_code_alpha2: 'US')) }

            it 'can be filled by country' 


            it 'can be filled by country_code' 


            it 'can be filled by country_code_alpha2' 


            it 'prioritizes country_code_alpha2' 

          end

          describe 'region' do
            let(:expected) { a_hash_including(billing: a_hash_including(region: 'Massachusetts')) }

            it 'can be filled by province' 


            it 'can be filled by state' 


            it 'can be filled by region' 


            it 'prioritizes region' 

          end

          describe 'region' do
            let(:expected) { a_hash_including(billing: a_hash_including(locality: 'Northampton')) }

            it 'can be filled by city' 


            it 'can be filled by locality' 


            it 'prioritizes locality' 

          end

          describe 'company' do
            let(:expected) { a_hash_including(billing: a_hash_including(company: "Mimmo's Pizza")) }

            it 'can be filled by company' 

          end
        end
      end
    end
  end
end

