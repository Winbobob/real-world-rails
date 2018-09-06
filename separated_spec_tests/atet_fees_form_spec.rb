require 'rails_helper'
module Refunds
  RSpec.describe FeesForm, type: :form do
    let(:session_attributes) { Refund.new.attributes.to_h }
    let(:refund_session) { double('Session', session_attributes) }
    let(:form) { described_class.new(refund_session) }

    it_behaves_like 'a Form', {
      et_issue_fee: '12',
      et_issue_fee_payment_method: 'card',
      et_issue_fee_payment_date: { day: '1', month: '1', year: '2016' }
    }, Session

    describe 'validation' do
      # Start of shared examples
      # As we are testing all 5 fees in the same way, some shared examples
      # are defined below.
      # These should stay in this file to make the test more readable
      shared_examples 'a positive fee with known date' do |fee_name:, fee:|
        fee_payment_date_field = "#{fee_name}_fee_payment_date".to_sym
        fee_payment_method_field = "#{fee_name}_fee_payment_method".to_sym
        before { form.send("#{fee_name}_fee=".to_sym, fee) }
        context "#{fee_payment_date_field} attribute" do
          it 'validates presence' 


          it 'validates date allowing valid value using partial date without day' 


          it 'validates date allowing a ruby date' 


          it 'validates date disallowing value past end date using partial date without day' 


          it 'validates date disallowing a ruby date which is past the end date' 


          it 'validates date disallowing value before start date using partial date without day' 


          it 'validates date disallowing a ruby date which is before the start date' 


          it 'validates date disallowing invalid value using partial date without day' 


          it 'validates date disallowing blank value' 

        end

        context "#{fee_payment_method_field} attribute" do
          it 'validates presence' 


          it 'validates inclusion of correct payment methods' 

        end
      end

      shared_examples 'a positive fee with unknown date' do |fee_name:, fee:|
        fee_payment_date_field = "#{fee_name}_fee_payment_date".to_sym
        before do
          form.send("#{fee_name}_fee=".to_sym, fee)
          form.send("#{fee_name}_fee_payment_date_unknown=", true)
        end

        context "#{fee_payment_date_field} attribute" do
          it 'does not validate presence' 


          it 'does not validate date - blank value' 

        end
      end

      shared_examples 'a zero or nil fee' do |fee_name:, fee:|
        fee_payment_date_field = "#{fee_name}_fee_payment_date".to_sym
        fee_payment_method_field = "#{fee_name}_fee_payment_method".to_sym
        before { form.send("#{fee_name}_fee=", fee) }
        context "#{fee_payment_date_field} attribute" do
          it 'does not validate presence' 


          it 'does not validate date - blank value' 

        end

        context "#{fee_payment_method_field} attribute" do
          it 'does not validate presence' 

        end
      end

      shared_examples 'any fee' do |fee_name:|
        it 'validates numeric values disallowing negative values' 

      end

      # Start of validation specs
      context 'with positive fees as float with known date' do
        include_examples 'a positive fee with known date', fee_name: :et_issue, fee: 12
        include_examples 'a positive fee with known date', fee_name: :et_hearing, fee: 12
        include_examples 'a positive fee with known date', fee_name: :et_reconsideration, fee: 12
        include_examples 'a positive fee with known date', fee_name: :eat_issue, fee: 12
        include_examples 'a positive fee with known date', fee_name: :eat_hearing, fee: 12
      end

      context 'with positive fees as string with known date' do
        include_examples 'a positive fee with known date', fee_name: :et_issue, fee: '12'
        include_examples 'a positive fee with known date', fee_name: :et_hearing, fee: '12'
        include_examples 'a positive fee with known date', fee_name: :et_reconsideration, fee: '12'
        include_examples 'a positive fee with known date', fee_name: :eat_issue, fee: '12'
        include_examples 'a positive fee with known date', fee_name: :eat_hearing, fee: '12'
      end

      context 'with positive fees as float with unknown date' do
        include_examples 'a positive fee with unknown date', fee_name: :et_issue, fee: 12
        include_examples 'a positive fee with unknown date', fee_name: :et_hearing, fee: 12
        include_examples 'a positive fee with unknown date', fee_name: :et_reconsideration, fee: 12
        include_examples 'a positive fee with unknown date', fee_name: :eat_issue, fee: 12
        include_examples 'a positive fee with unknown date', fee_name: :eat_hearing, fee: 12
      end

      context 'with positive fees as string with unknown date' do
        include_examples 'a positive fee with unknown date', fee_name: :et_issue, fee: '12'
        include_examples 'a positive fee with unknown date', fee_name: :et_hearing, fee: '12'
        include_examples 'a positive fee with unknown date', fee_name: :et_reconsideration, fee: '12'
        include_examples 'a positive fee with unknown date', fee_name: :eat_issue, fee: '12'
        include_examples 'a positive fee with unknown date', fee_name: :eat_hearing, fee: '12'
      end

      context 'with no fees' do
        include_examples 'a zero or nil fee', fee_name: :et_issue, fee: nil
        include_examples 'a zero or nil fee', fee_name: :et_hearing, fee: nil
        include_examples 'a zero or nil fee', fee_name: :et_reconsideration, fee: nil
        include_examples 'a zero or nil fee', fee_name: :eat_issue, fee: nil
        include_examples 'a zero or nil fee', fee_name: :eat_hearing, fee: nil

        it 'fails validation as there are no fees represented as empty string' 


        it 'fails validation as there are no fees represented as nil' 

      end

      context 'with zero fees' do
        include_examples 'a zero or nil fee', fee_name: :et_issue, fee: 0.0
        include_examples 'a zero or nil fee', fee_name: :et_hearing, fee: 0.0
        include_examples 'a zero or nil fee', fee_name: :et_reconsideration, fee: 0.0
        include_examples 'a zero or nil fee', fee_name: :eat_issue, fee: 0.0
        include_examples 'a zero or nil fee', fee_name: :eat_hearing, fee: 0.0

        it 'fails validation as there are no fees' 

      end

      context 'common validations per fee' do
        include_examples 'any fee', fee_name: :et_issue
        include_examples 'any fee', fee_name: :et_hearing
        include_examples 'any fee', fee_name: :et_reconsideration
        include_examples 'any fee', fee_name: :eat_issue
        include_examples 'any fee', fee_name: :eat_hearing
      end
    end

    context 'attribute writers' do
      shared_examples 'a fee date writer' do |fee_name:|
        reader_method = "#{fee_name}_fee_payment_date".to_sym
        writer_method = "#{fee_name}_fee_payment_date=".to_sym
        it 'converts a partial date from a hash' 


        it 'converts an empty partial date from a hash to nil' 


        it 'converts a full date from a hash' 


        it 'converts a full date from a yyyy-mm-dd string' 


        it 'leaves an invalid date from a hash as is' 


        it 'converts a partial date from an action controller params instance' 


        it 'converts an empty partial date from an action controller params instance to nil' 


        it 'converts a full date from an action controller params instance' 


        it 'leaves an invalid date as a hash from an action controller params instance as is' 


        it 'does not convert nil' 

      end

      shared_examples 'a fee amount writer' do |fee_name:|
        reader_method = "#{fee_name}_fee".to_sym
        writer_method = "#{fee_name}_fee=".to_sym
        it 'converts an amount from a string' 


        it 'converts an amount from a float' 


        it 'leaves an invalid number from a string as is' 


        it 'does not convert nil' 

      end

      context 'fee date writers' do
        include_examples 'a fee date writer', fee_name: :et_issue
        include_examples 'a fee date writer', fee_name: :et_hearing
        include_examples 'a fee date writer', fee_name: :et_reconsideration
        include_examples 'a fee date writer', fee_name: :eat_issue
        include_examples 'a fee date writer', fee_name: :eat_hearing
      end

      context 'fee amount writers' do
        include_examples 'a fee amount writer', fee_name: :et_issue
        include_examples 'a fee amount writer', fee_name: :et_hearing
        include_examples 'a fee amount writer', fee_name: :et_reconsideration
        include_examples 'a fee amount writer', fee_name: :eat_issue
        include_examples 'a fee amount writer', fee_name: :eat_hearing
      end
    end
  end
end

