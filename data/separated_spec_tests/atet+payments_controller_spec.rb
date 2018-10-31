require 'rails_helper'

RSpec.describe PaymentsController do
  # The majority of this controller is tested in the feature spec. This spec
  # is just for event logging

  let(:claim) { create :claim, fee_group_reference: '511234567800', state: 'payment_required' }

  describe 'logging events' do
    before do
      # Don't want the job immediately 'submitting' the thing
      allow(ClaimSubmissionJob).to receive(:perform_later)
      allow(Claim).to receive(:find_by).
        with(fee_group_reference: '511234567800').
        and_return claim

      allow(claim).to receive_messages(create_payment: true, enqueue!: true)
    end

    describe 'when a callback hits the success endpoint' do
      context 'with a successful response' do
        it 'logs an event' 

      end

      context 'with an uncertain payment status' do
        context 'with a 52: authorisation unknown status' do
          it 'logs an event with a message' 

        end

        context 'with a 92: payment uncertain status' do
          it 'logs an event with a message' 

        end

        context 'with an unrecognized response status' do
          it 'logs an event with a message containing the status code' 

        end
      end
    end

    describe 'when a callback hits the decline endpoint' do
      context 'for a failed payment' do
        it 'logs an event' 


        it 'payment_response is not valid' 

      end
    end
  end
end

