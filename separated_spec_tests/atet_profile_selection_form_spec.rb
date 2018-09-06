require 'rails_helper'
module Refunds
  RSpec.describe ProfileSelectionForm, type: :form do
    let(:session_attributes) { Refund.new.attributes.to_h }
    let(:refund_session) { double('Session', session_attributes) }
    let(:form) { described_class.new(refund_session) }

    it_behaves_like 'a Form', { profile_type: 'claimant_direct_not_reimbursed' }, Refund

    describe 'validations' do
      context 'profile_type' do
        it 'validates presence of' 


        it 'validates inclusion' 

      end
    end

  end
end

