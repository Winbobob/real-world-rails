require 'rails_helper'
module Refunds
  RSpec.describe BankDetailsForm, type: :form do
    let(:session_attributes) { Refund.new.attributes.to_h }
    let(:refund_session) { double('Session', session_attributes) }
    let(:form) { described_class.new(refund_session) }

    describe 'validations' do
      context 'payment_account_type' do
        it 'validates presence' 


        it 'validates inclusion' 

      end

      shared_examples 'an account' do |account_type:|
        before { form.payment_account_type = account_type }

        context "payment_#{account_type}_account_name" do
          it 'validates presence' 

        end
        context "payment_#{account_type}_name" do
          it 'validates presence' 

        end
        context "payment_#{account_type}_account_number" do
          it 'validates presence' 


          it 'allows an 8 digit number' 


          it 'disallows a 7 digit number' 


          it 'disallows a 9 digit number' 


          it 'disallows alphas in the number' 


          it 'disallows hyphens in the number' 


          it 'disallows slashes in the number' 

        end

        context "payment_#{account_type}_sort_code" do
          it 'validates presence' 


          it 'allows a 6 digit number' 


          it 'disallows a 5 digit number' 


          it 'disallows a 7 digit number' 


          it 'disallows alphas in the number' 


          it 'disallows hyphens in the number' 


          it 'disallows slashes in the number' 

        end
      end

      context 'with payment_account_type as bank' do
        include_examples 'an account', account_type: :bank
      end

      context 'with payment_account_type as building_society' do
        include_examples 'an account', account_type: :building_society
      end
    end

    it_behaves_like 'a Form',
      {
        payment_account_type: 'bank',
        payment_bank_account_name: 'Mr Skywalker',
        payment_bank_name: 'Starship Bank',
        payment_bank_account_number: '12345678',
        payment_bank_sort_code: '123456'
      }, Session
  end
end

