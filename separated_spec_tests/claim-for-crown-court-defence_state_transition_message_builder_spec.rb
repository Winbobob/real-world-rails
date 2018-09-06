require 'rails_helper'

RSpec.describe Claims::StateTransitionMessageBuilder do
  subject { described_class.new(state, reasons, reason_text).call }

  context '#call' do
   context 'when refused' do
      let(:state) { 'refused' }
      let(:reasons) { %w[wrong_ia duplicate_claim other_refuse] }
      let(:reason_text) { 'refused because...'}

      it 'contains message header' 


      it 'contains short description of reason' 


      it 'contains long description of reason' 


      it 'contains case worker specified other refusal message' 

    end

    context 'when rejected' do
      let(:state) { 'rejected' }
      let(:reasons) { %w[wrong_maat_ref no_indictment other] }
      let(:reason_text) { 'rejected because...'}

      it 'contains message header' 


      it 'contains short description of reason' 


      it 'contains long description of reason' 


      it 'contains case worker specified other rejection message' 

    end
  end
end

