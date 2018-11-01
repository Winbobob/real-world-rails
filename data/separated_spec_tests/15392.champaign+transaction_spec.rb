# frozen_string_literal: true

require 'rails_helper'
require_relative 'transaction_and_subscription_examples'

module PaymentProcessor
  module GoCardless
    describe Transaction do
      describe '.make_transaction' do
        before do
          allow(Payment::GoCardless).to receive(:write_transaction).and_return(local_transaction)
          allow(Payment::GoCardless).to receive(:write_customer).and_return(local_customer)
          allow(Payment::GoCardless).to receive(:write_mandate).and_return(local_mandate)
          allow(PaymentProcessor::Currency).to receive(:convert).and_return(double(cents: amount_in_euros * 100))

          allow_any_instance_of(GoCardlessPro::Services::RedirectFlowsService).to receive(:complete).and_return(completed_flow)
          allow_any_instance_of(GoCardlessPro::Services::RedirectFlowsService).to receive(:get).and_return(completed_flow)
          allow_any_instance_of(GoCardlessPro::Services::MandatesService).to receive(:get).and_return(mandate)
          allow_any_instance_of(GoCardlessPro::Services::CustomerBankAccountsService).to receive(:get).and_return(bank_account)
          allow_any_instance_of(GoCardlessPro::Services::PaymentsService).to receive(:create).and_return(payment)

          allow(ManageDonation).to receive(:create) { action }
        end

        let(:action) { instance_double('Action', member_id: 2) }
        let(:local_transaction) { instance_double('Payment::GoCardless::Transaction', go_cardless_id: 'PA00000') }
        let(:local_customer) { instance_double('Payment::GoCardless::Customer', id: 7) }
        let(:local_mandate) { instance_double('Payment::GoCardless::PaymentMethod', id: 1234) }

        let(:gc_error) { GoCardlessPro::ValidationError.new(message: 'invalid') }

        let(:completed_flow) do
          instance_double('GoCardlessPro::Resources::RedirectFlow',
                          links: double(customer: 'CU00000', mandate: 'MA00000', customer_bank_account: 'BA00000'))
        end
        let(:mandate) do
          instance_double('GoCardlessPro::Resources::Mandate',
                          id: 'MA00000', scheme: 'sepa', next_possible_charge_date: 1.day.from_now.to_date.to_s, reference: 'SOU-00000')
        end
        let(:bank_account) do
          instance_double('GoCardlessPro::Resources::CustomerBankAccount',
                          id: 'BA00000', bank_name: 'BARCLAYS', account_number_ending: '11')
        end

        let(:payment) { instance_double('GoCardlessPro::Resources::Payment', id: 'PA00000', charge_date: '2016-05-20') }

        let(:amount_in_dollars) { 12.5 }
        let(:amount_in_euros) { 10.98 }
        let(:page_id) { 1 }
        let(:required_options) do
          {
            amount: amount_in_dollars,
            currency: 'USD',
            user: { email: 'bob@example.com', name: 'Bob' },
            page_id: page_id,
            redirect_flow_id: 'RE00000',
            session_token: '4f592f2a-2bc2-4028-8a8c-19b222e2faa7'
          }
        end

        subject { described_class.make_transaction(required_options) }

        include_examples 'transaction and subscription', :make_transaction

        describe 'calling the GC SDK' do
          context 'with EUR' do
            it 'creates a transaction with the right params and charge date' 

          end

          context 'with GBP' do
            let(:amount_in_gbp) { 11.11 }
            let(:completed_gbp_flow) do
              instance_double('GoCardlessPro::Resources::RedirectFlow',
                              links: double(customer: 'CU00000', mandate: 'MA9999', customer_bank_account: 'BA00000'))
            end
            let(:gbp_mandate) do
              instance_double('GoCardlessPro::Resources::Mandate',
                              id: 'MA9999', scheme: 'bacs', next_possible_charge_date: '2016-05-22', reference: 'SOU-00000')
            end
            let(:gbp_options) do
              {
                amount: amount_in_gbp,
                currency: 'GBP',
                user: { email: 'bob@example.com', name: 'Bob' },
                page_id: page_id,
                redirect_flow_id: 'RE00000',
                session_token: '4f592f2a-2bc2-4028-8a8c-19b222e2faa7'
              }
            end

            before do
              allow_any_instance_of(GoCardlessPro::Services::RedirectFlowsService).to receive(:complete).and_return(completed_gbp_flow)
              allow_any_instance_of(GoCardlessPro::Services::RedirectFlowsService).to receive(:get).and_return(completed_gbp_flow)
              allow_any_instance_of(GoCardlessPro::Services::MandatesService).to receive(:get).and_return(gbp_mandate)
              allow(PaymentProcessor::Currency).to receive(:convert).and_return(double(cents: amount_in_gbp * 100))
            end

            it 'creates a transaction with the right params and charge date' 


            it 'uses the gbp charge day that is specified in the Settings class' 


            it 'uses the next possible charge date of the mandate if GBP charge date is not defined' 


            it 'logs an error if the charge day is invalid' 

          end
        end

        describe 'bookkeeping' do
          it 'delegates to Payment::GoCardless.write_transaction' 


          it 'delegates to ManageDonation.create' 

        end

        describe 'setting charge_date for GBP on next available 20th day of a month' do
          let(:next_possible_charge_date) {}
          let(:gbp_mandate) do
            instance_double('GoCardlessPro::Resources::Mandate',
                            id: 'MA00000', scheme: 'bacs', next_possible_charge_date: next_possible_charge_date)
          end
        end
      end
    end
  end
end

